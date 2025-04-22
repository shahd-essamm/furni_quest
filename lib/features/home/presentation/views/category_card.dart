import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/data/models/category_model.dart';

class CategoryCardItem extends StatefulWidget {
  final Categories category;
  final void Function()? onTap;

  const CategoryCardItem({
    super.key,
    required this.category,
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
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Container(
              height: 64,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.category.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.category.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
