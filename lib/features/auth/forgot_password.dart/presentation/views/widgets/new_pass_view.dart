import 'package:flutter/material.dart';
import 'package:furni_quest/features/auth/signin/presentation/views/signin_view.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  static const routeName = 'new-password-view';

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Color(0xFF3A3E39), size: 24),
                  onPressed: () {
                    // العودة إلى صفحة SignInPage
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'New Password',
                style: TextStyle(
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF3A3E39),
                ),
              ),
              const SizedBox(height: 0),
              const Text(
                'Your new password must be different\nfrom previously used passwords',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF646B62),
                ),
              ),
              const SizedBox(height: 30),
              // Password field with helper text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: 'Heebo',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF4B5049),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 335,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1A101828),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                      border: Border.all(color: Color(0xFFC3C9C0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: TextField(
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "••••••••••",
                          hintStyle: const TextStyle(
                            fontFamily: 'Heebo',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFFC3C9C0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          color: Color(0xFF3A3E39),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Must have 8 characters",
                    style: TextStyle(
                      fontFamily: 'Heebo',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF7D867A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Confirm Password field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontFamily: 'Heebo',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF4B5049),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 335,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1A101828),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                      border: Border.all(color: Color(0xFFC3C9C0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: TextField(
                        obscureText: !_isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "••••••••••",
                          hintStyle: const TextStyle(
                            fontFamily: 'Heebo',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFFC3C9C0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          color: Color(0xFF3A3E39),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Create New Password Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInView(),
                    ),
                  );
                  // Action for button (يمكنك إضافة الكود هنا للتعامل مع الزر)
                },
                child: Container(
                  width: 335,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xFF53634F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Create new password',
                    style: TextStyle(
                      fontFamily: 'Heebo',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
