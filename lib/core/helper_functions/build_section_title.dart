import 'package:flutter/material.dart';
import 'package:furni_quest/core/utils/app_colors.dart';

Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor),
      ),
    );
  }