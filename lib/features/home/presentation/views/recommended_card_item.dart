import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/product_deatils_view.dart';

class RecommendedCardItem extends StatefulWidget {
  final String title;
  final String image;
  final double price;
  final int rating;

  const RecommendedCardItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  State<RecommendedCardItem> createState() => _RecommendedCardItemState();
}

class _RecommendedCardItemState extends State<RecommendedCardItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsView(
              title: widget.title,
              image: widget.image,
              price: widget.price,
              rating: widget.rating,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    widget.image,
                    width: double.infinity,
                    height: 110,
                  ),
                ),
                Positioned(
                  right: 1,
                  top: 3,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < widget.rating ? Icons.star : Icons.star_border,
                        size: 16,
                        color: Colors.orangeAccent,
                      );
                    }),
                  ),
                  Text(
                    '\$${widget.price.toString()}',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
