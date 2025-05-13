import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/data/models/new_arrival_model.dart';
import 'package:furni_quest/features/home/presentation/widgets/new_arrivals/new_arrivals_products.dart';

class NewArrivalItem extends StatefulWidget {
  final NewArrivalModel newArrival;

  const NewArrivalItem({super.key, required this.newArrival});

  @override
  State<NewArrivalItem> createState() => _NewArrivalItemState();
}

class _NewArrivalItemState extends State<NewArrivalItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewArrivalsProducts(
                  product: widget.newArrival,
                ),
              ),
            );
          },
        child: Container(
          width: 103,
          height: 98,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: widget.newArrival.images.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.newArrival.images[0].imageUrl,
                      height: 98,
                      width: 103,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _placeholderImage();
                      },
                    ),
                  )
                : _placeholderImage(),
          ),
        ),
      ),
    );
  }
}

Widget _placeholderImage() {
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
}
