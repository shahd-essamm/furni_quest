import 'package:flutter/material.dart';
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
              height: 550,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 15, // تغيير المسافة بين النصين
              child: Text(
                "The FurniQuest App",
                style: const TextStyle(
                  fontFamily: 'Heebo',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4F4C43),
                ),
              ),
            ),
            Positioned(
              bottom: 1, // وضع الجملة الثانية أقرب إلى الأولى
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Step into a world of comfort and style. Discover furniture that elevates your home's ambiance.",
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF768571),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SignupView.routeName,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF657660), // تغيير لون الزر
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: const BorderSide(
                color: Color(0xFF657660),
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fixedSize: const Size(335, 44),
            ),
            child: const Text(
              "Let’s Get Started",
              style: TextStyle(
                fontFamily: 'Heebo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // النص باللون الأبيض
              ),
            ),
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
