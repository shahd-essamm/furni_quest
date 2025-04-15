import 'package:flutter/material.dart';
import 'package:furni_quest/core/utils/app_colors.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5,
      color: AppColors.primaryColor,
    );
  }
}
