import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/views/category_card.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/search_chair_view.dart';

class CategoryCardListView extends StatelessWidget {
  const CategoryCardListView({
    super.key,
  });

  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => CategoryCardItem(
          title: 'Chairs',
          image: 'assets/BrownChairSmall.png',
          onTap: () => Navigator.pushNamed(
            context,
            SearchChairView.routeName,
          ),
        ),
      ),
    );
  }
}
