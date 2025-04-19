import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  Color get textColor => const Color(0xFF3A3E39);
  Color get bodyTextColor => const Color(0xFF657660);
  Color get buttonColor => const Color(0xFF657660);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 24, color: textColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Privacy',
                        style: TextStyle(
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // موازنة مع زر الرجوع
                ],
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    // مسافة فوق النص
                    SizedBox(height: screenHeight * 0.02),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          '''Your privacy is important to us. It is Brainstorming's policy to respect your privacy regarding any information we may collect from you across our website, and other sites we own and operate.

We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.

We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.

We don’t share any personally identifying information publicly or with third-parties, except when required to by law.''',
                          style: TextStyle(
                            fontFamily: 'Heebo',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: bodyTextColor,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ),
                    // رفع الزر شوية
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // Action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "I've agree with this",
                          style: TextStyle(
                            fontFamily: 'Heebo',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04), // مسافة تحت الزر
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
