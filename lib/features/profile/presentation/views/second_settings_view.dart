import 'package:flutter/material.dart';
import 'package:furni_quest/features/profile/presentation/views/notifications_view.dart';
import 'package:furni_quest/features/profile/presentation/views/password_manager_view.dart';
import 'package:furni_quest/features/profile/presentation/views/security_settings_view.dart';

class SecondSettingsPage extends StatelessWidget {
  const SecondSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar custom
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        size: 24, color: Color(0xFF3A3E39)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'Settings',
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

            // Setting Items
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    _buildSettingItem(
                      icon: Icons.notifications_none,
                      label: 'Notification Settings',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NotificationPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSettingItem(
                      icon: Icons.vpn_key_outlined,
                      label: 'Password Manager',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PasswordMangerPage()));
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSettingItem(
                      icon: Icons.shield_outlined,
                      label: 'Security Settings',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SecuritySettingsPage()));
                      },
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

  Widget _buildSettingItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: const Color(0xFFC3C9C0).withOpacity(0.5),
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: const Color(0xFF53634F)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF3A3E39),
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 24, color: Color(0xFF3A3E38)),
          ],
        ),
      ),
    );
  }
}
