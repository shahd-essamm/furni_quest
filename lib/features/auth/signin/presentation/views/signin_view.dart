import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/core/widgets/custom_button.dart';
import 'package:furni_quest/features/auth/forgot_password.dart/presentation/views/forgot_password_view.dart';
import 'package:furni_quest/features/auth/signin/presentation/cubits/auth_cubit.dart';
import 'package:furni_quest/features/auth/signin/presentation/cubits/auth_state.dart';
import 'package:furni_quest/features/home/presentation/views/main_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routeName = 'signin';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // جعل الخلفية بيضاء
      body: SafeArea(
        child: SingleChildScrollView(
          // جعل المحتوى قابل للتمرير عند ظهور الكيبورد
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 35), // جعل الصورة أعلى الصفحة
                // Logo (Image)
                SizedBox(
                  width: 48,
                  height: 70.71,
                  child: Image.asset('assets/logo_sgin_in.png',
                      fit: BoxFit.contain),
                ),
                const SizedBox(height: 3),
                // "Sign In" text
                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3A3E39),
                  ),
                ),
                const SizedBox(height: 0),
                // Subtitle text
                const Text(
                  "Hi! Welcome back, you’ve been missed",
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF646B62),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 17),
                // Email field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5049),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          40, // تحديد العرض بناءً على العرض المتاح
                      height: 44,
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B2A3),
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          hintStyle: const TextStyle(
                            fontFamily: 'Heebo',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3A3E39),
                          ),
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Password field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5049),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          40, // تحديد العرض بناءً على العرض المتاح
                      height: 44,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B2A3),
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          hintStyle: const TextStyle(
                            fontFamily: 'Heebo',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3A3E39),
                          ),
                          suffixIcon: const Icon(Icons.visibility_off_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordView(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF657660),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                // Sign In button

                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainView()),
                      );
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<AuthCubit>();

                    return state is AuthLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            title: "Sign In",
                            onTap: () {
                              // اجلب البيانات من الحقول
                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();
                              cubit.login(email, password);
                            },
                          );
                  },
                ),

                const SizedBox(height: 15),
                // Google Sign In

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/google_icon.svg"),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 7),
                // Apple Sign In
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/apple_icon.svg"),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Sign in with Apple",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                // Register link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF3B3A35),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, SignInView.routeName);
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF657660),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
