import 'package:flutter/material.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({
    super.key,
    required this.rate,
  });

  final int rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rate ? Icons.star : Icons.star_border,
          color: index < rate ? Colors.amber : Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}
