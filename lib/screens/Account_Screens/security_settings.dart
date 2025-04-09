import 'package:flutter/material.dart';

class SecuritySettingsPage extends StatelessWidget {
  const SecuritySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'Security Settings',
                    style: TextStyle(
                      fontFamily: 'Heebo',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF3A3E39),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Account Deletion Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEFE5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account Deletion',
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF3A3E39),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'We are sad to see you go, but hope to see you again!',
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF646B62),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        _showDeleteDialog(context);
                      },
                      child: const Text(
                        'Delete your account',
                        style: TextStyle(
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF9E291B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFFEAEFE5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Are you sure?',
            style: TextStyle(
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF3A3E39),
            ),
          ),
          content: const Text(
            'Do you really want to delete your account?',
            style: TextStyle(
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF646B62),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // يقفل الـ Dialog فقط
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF646B62),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // هتقفل الديالوج فقط
                // مكان تنفيذ API بعد ما توصلك
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF9E291B),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
