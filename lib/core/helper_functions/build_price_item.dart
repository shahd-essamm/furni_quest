import 'package:flutter/material.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_check_box.dart';

Widget buildPriceItem({
  required String priceRange,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CustomCheckBox(
            isChecked: isSelected,
            onChecked: (_) => onTap(),
          ),
          SizedBox(width: 8),
          Text(
            priceRange,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
