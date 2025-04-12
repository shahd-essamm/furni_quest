import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/views/home_view.dart';
import 'package:furni_quest/features/cart/presentation/views/cart_view.dart';
import 'package:furni_quest/features/categoris/presentation/views/categories_view.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 70,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(context, Icons.home, "HomePage"),
          _buildNavItem(context, Icons.grid_view, "Categories"),
          _buildNavItem(context, Icons.qr_code_scanner, "scann"),
          _buildNavItem(context, Icons.shopping_bag, "Cart"),
          _buildNavItem(context, Icons.person, "Profile"),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String page) {
    return GestureDetector(
      onTap: () {
        if (page == "HomePage") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
          );
        }
        if (page == "Categories") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoriesView(),
            ),
          );
        }
        if (page == "Cart") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartView(),
            ),
          );
        }
        if (page == "Profile") {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SettingsPage(),
          //   ),
          // );
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: page == "HomePage" ? Color(0xFFB9C5B1) : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 24,
          color: Color(0xFF53634F),
        ),
      ),
    );
  }
}
