import 'package:flutter/material.dart';
import 'package:furni_quest/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.onTap,
  });

  final String title;
  final Color? textColor, backgroundColor, borderColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor ?? AppColors.primaryColor,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor ?? Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
