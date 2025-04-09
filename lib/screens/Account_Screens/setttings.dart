import 'package:flutter/material.dart';
import 'package:furni_quest/screens/Account_Screens/privacy.dart';
import 'package:furni_quest/screens/Account_Screens/second_settings.dart';
import 'package:furni_quest/screens/Account_Screens/your_profile.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  Color get backgroundColor => const Color(0xFF657660);
  Color get textColor => const Color(0xFF3A3E39);
  Color get subTextColor => const Color(0xFF646B62);
  Color get iconColor => const Color(0xFF53634F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24, color: textColor),
          onPressed: () {},
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

          GestureDetector(
            onTap: () {
              // هنا تضيف الأكشن بعدين
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 52.5,
                  backgroundImage: AssetImage('assets/account_image/Settings.png'),
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
                  _buildItem(context, Icons.person, 'Your profile', const ProfilePage()),
                  _buildItem(context, Icons.location_on, 'Manage Address', null),
                  _buildItem(context, Icons.payment, 'Payment Methods', null),
                  _buildItem(context, Icons.shopping_bag, 'My Orders', null),
                  _buildItem(context, Icons.settings, 'Settings', const SecondSettingsPage()),
                  _buildItem(context, Icons.help_outline, 'Help Center', null),
                  _buildItem(context, Icons.privacy_tip, 'Privacy',  const PrivacyPage()),
                  _buildItem(context, Icons.logout, 'Log out', null),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String title, Widget? page) {
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
          trailing: const Icon(Icons.arrow_forward_ios, size: 24, color: Color(0xFF3A3E39)),
          onTap: page != null
              ? () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
              : null,
        ),
      ),
    );
  }
}
