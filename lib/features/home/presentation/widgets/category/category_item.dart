import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/data/models/sub_category_model.dart';
import 'package:furni_quest/features/home/presentation/widgets/category/category_card_details.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.subCategory});
  final SubCategory subCategory;
  // final CategoryProductModel categoryProductModel;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final int? categoryId = widget.subCategory.categoryId;
        final SubCategory subCategory = widget.subCategory;
        if (categoryId != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryCardDetails(
                    categoryId: widget.subCategory.categoryId!,
                    subCategory: subCategory,
                    
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid category ID'),
            ),
          );
        }
      },
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
                  image: NetworkImage(widget.subCategory.image ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.subCategory.name ?? '',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
