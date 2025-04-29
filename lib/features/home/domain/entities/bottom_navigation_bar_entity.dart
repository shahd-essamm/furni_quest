import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarEntity {
  final Widget icon;
  final String name;

  BottomNavigationBarEntity({required this.icon, required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
        icon: SvgPicture.asset(
          'assets/home_icon.svg',
        ),
        name: 'Home',
      ),
      BottomNavigationBarEntity(
        icon: SvgPicture.asset(
          'assets/category_icon.svg',
        ),
        name: 'Categories',
      ),
      BottomNavigationBarEntity(
        icon: SvgPicture.asset(
          'assets/discovery_icon.svg',
        ),
        name: 'Discovery',
      ),
      BottomNavigationBarEntity(
        icon: SvgPicture.asset(
          'assets/cart_icon.svg',
        ),
        name: 'Cart',
      ),
      BottomNavigationBarEntity(
        icon: SvgPicture.asset(
          'assets/user_icon.svg',
        ),
        name: 'Profile',
      ),
    ];
