import 'package:flutter/material.dart';
import 'package:furni_quest/core/widgets/custom_button.dart';
import 'package:furni_quest/features/auth/signin/presentation/views/signin_view.dart';
import 'package:furni_quest/features/auth/signup/presentation/views/signup_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Stack للصورة والنص
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/Background Container.png', // استبدل بمسار الصورة الخاص بك
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      "The FurniQuest App",
                      style: const TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F4C43),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Step into a world of comfort and style. Discover furniture that elevates your home's ambiance.",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF768571),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomButton(
            title: "Let’s Get Started",
            onTap: () {
              Navigator.pushNamed(
                context,
                SignupView.routeName,
              );
            },
          ),
        ),

        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account? ",
              style: TextStyle(
                fontFamily: 'Heebo',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF3B3A35),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SignInView.routeName,
                );
              },
              child: const Text(
                "Sign in",
                style: TextStyle(
                  fontFamily: 'Heebo',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF657660),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
