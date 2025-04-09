import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furni_quest/screens/Forgot%20password-email.dart';
import 'Home_Screens/home_page.dart';



class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // جعل الخلفية بيضاء
      body: SafeArea(
        child: SingleChildScrollView( // جعل المحتوى قابل للتمرير عند ظهور الكيبورد
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 35), // جعل الصورة أعلى الصفحة
                // Logo (Image)
                Container(
                  width: 48,
                  height: 70.71,
                  child: Image.asset('assets/logo_sgin_in.png', fit: BoxFit.contain),
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
                    Container(
                      width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                      height: 44,
                      child: TextField(
                        style: const TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B2A3),
                        ),
                        decoration: InputDecoration(
                          hintText: "Mariam sobhy654@gmail.com",
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
                    Container(
                      width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                      height: 44,
                      child: TextField(
                        obscureText: true,
                        style: const TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B2A3),
                        ),
                        decoration: InputDecoration(
                          hintText: "●●●●●●●",
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
                          builder: (context) =>  ForgotPasswordScreen(),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF657660),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  HomeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Google Sign In
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                  height: 44,
                  child: OutlinedButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.google),
                    label: const Text(
                      "Sign in with Google",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5049),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 7),
                // Apple Sign In
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                  height: 44,
                  child: OutlinedButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.apple),
                    label: const Text(
                      "Sign in with Apple",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5049),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
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
                      onPressed: () {},
                      child: const Text(
                        "Sign in",
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
