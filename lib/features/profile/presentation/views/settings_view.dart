import 'package:flutter/material.dart';
import 'package:furni_quest/features/profile/presentation/views/privacy_view.dart';
import 'package:furni_quest/features/profile/presentation/views/profile_view.dart';
import 'package:furni_quest/features/profile/presentation/views/second_settings_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const String routeName = 'settings';

  final Color backgroundColor = const Color(0xFF657660);
  final Color textColor = const Color(0xFF3A3E39);
  final Color subTextColor = const Color(0xFF646B62);
  final Color iconColor = const Color(0xFF53634F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Heebo',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: textColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 52.5,
                backgroundImage:
                    AssetImage('assets/account_image/Settings.png'),
                backgroundColor: Colors.transparent,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Mariam Sobhy',
            style: TextStyle(
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFF3A3E39),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'MariamSobhy@gmail.com',
            style: TextStyle(
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFF646B62),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0x1A657660),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: ListView(
                children: [
                  _buildItem(
                    context,
                    Icons.person,
                    'Your profile',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileView(),
                        ),
                      );
                    },
                  ),
                  _buildItem(
                      context, Icons.location_on, 'Manage Address', () {}),
                  _buildItem(context, Icons.payment, 'Payment Methods', () {}),
                  _buildItem(context, Icons.shopping_bag, 'My Orders', () {}),
                  _buildItem(
                    context,
                    Icons.settings,
                    'Settings',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondSettingsPage(),
                        ),
                      );
                    },
                  ),
                  _buildItem(context, Icons.help_outline, 'Help Center', () {}),
                  _buildItem(
                    context,
                    Icons.privacy_tip,
                    'Privacy',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPage(),
                        ),
                      );
                    },
                  ),
                  _buildItem(context, Icons.logout, 'Log out',
                      () => showLogoutDialog(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, IconData icon, String title, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: 335,
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Icon(icon, size: 24, color: iconColor),
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF3A3E39),
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              size: 24, color: Color(0xFF3A3E39)),
          onTap: onTap,
        ),
      ),
    );
  }

  // Dialog logout
  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //
                Image.asset(
                  'assets/logout_icon.png',
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 28),

                //
                const Text(
                  'Oh no! you’re leaving..',
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xFF3A3E39),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),

                //
                const Text(
                  'Are you sure?',
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xFF3A3E39),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // 2 Buttons
                Row(
                  children: [
                    // Cancel Button
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF96A093)),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'Heebo',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4B5049),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Yes, Log out Button
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            // API
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF657660),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Yes, Log out',
                            style: TextStyle(
                              fontFamily: 'Heebo',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
