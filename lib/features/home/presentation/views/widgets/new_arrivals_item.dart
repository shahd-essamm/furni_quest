import 'package:flutter/material.dart';

class NewArrivalItem extends StatelessWidget {
  final String image;

  const NewArrivalItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 103,
        height: 98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            height: 98, // Adjust height for image
            width: 103,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}