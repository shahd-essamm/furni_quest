import 'package:flutter/material.dart';
import 'package:furni_quest/core/utils/app_colors.dart';

class BottomNavigationBarEntity {
  final Widget activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
        activeImage: Icon(Icons.home, color: AppColors.primaryColor,),
        inActiveImage: Icon(Icons.home_outlined, color: AppColors.primaryColor,),
        name: 'Home',
      ),
      BottomNavigationBarEntity(
        activeImage: Icon(Icons.grid_view, color: AppColors.primaryColor,),
        inActiveImage: Icon(Icons.grid_view_outlined, color: AppColors.primaryColor,),
        name: 'Categories',
      ),
      BottomNavigationBarEntity(
        activeImage: Icon(Icons.qr_code_scanner),
        inActiveImage: Icon(Icons.qr_code_scanner_outlined, color: AppColors.primaryColor,),
        name: 'Scann',
      ),
      BottomNavigationBarEntity(
        activeImage: Icon(Icons.shopping_bag, color: AppColors.primaryColor,),
        inActiveImage: Icon(Icons.shopping_bag_outlined, color: AppColors.primaryColor,),
        name: 'Cart',
      ),
      BottomNavigationBarEntity(
        activeImage: Icon(Icons.person, color: AppColors.primaryColor,),
        inActiveImage: Icon(Icons.person_outlined, color: AppColors.primaryColor,),
        name: 'Profile',
      ),
    ];
