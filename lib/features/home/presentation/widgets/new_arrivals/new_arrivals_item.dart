import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/data/models/new_arrival_model.dart';

class NewArrivalItem extends StatelessWidget {
  final NewArrivalModel newArrival;

  const NewArrivalItem({super.key, required this.newArrival});

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
          child: Image.network(
            newArrival.image,
            height: 98, // Adjust height for image
            width: 103,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 103,
                height: 98,
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.image_not_supported,
                  size: 40,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
