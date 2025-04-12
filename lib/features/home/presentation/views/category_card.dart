import 'package:flutter/material.dart';

class CategoryCardItem extends StatefulWidget {
  final String title;
  final String image;
  final void Function()? onTap;

  const CategoryCardItem({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  State<CategoryCardItem> createState() => _CategoryCardItemState();
}

class _CategoryCardItemState extends State<CategoryCardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            height: 64,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
