import 'package:flutter/material.dart';

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color titleColor = const Color(0xFF3A3E39);
    final Color subtitleColor = const Color(0xFF646B62);
    final Color buttonColor = const Color(0xFF657660);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24, color: titleColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Manage Address',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: titleColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // الجزء اللي في النص
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/location_in_manage_address.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'What is your Location?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'We need to know your location in order to\nsuggest nearby services.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // الجزء اللي تحت (الزر والكلمة)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Handle location access
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Allow Location Access',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to manual location input
                    },
                    child: Text(
                      'Enter Location Manually',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
