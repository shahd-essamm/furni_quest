import 'package:flutter/material.dart';
import 'package:furni_quest/core/utils/app_colors.dart';

class CustomReviewsWidget extends StatelessWidget {
  const CustomReviewsWidget({
    super.key,
    required this.index,
    required this.pressentage,
  });
  final String index;
  final double pressentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          index,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 15,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: LinearProgressIndicator(
              value: pressentage,
              backgroundColor: Colors.grey.shade300,
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
