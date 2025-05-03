import 'package:flutter/material.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/core/widgets/custom_divider_widget.dart';

Widget buildExpandableSection({
  required String title,
  required bool isExpanded,
  required VoidCallback onToggle,
  required Widget child,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: onToggle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
          ],
        ),
      ),
      if (isExpanded) ...[
        SizedBox(height: 8),
        child,
        SizedBox(height: 12),
      ],
      CustomDividerWidget(),
    ],
  );
}
