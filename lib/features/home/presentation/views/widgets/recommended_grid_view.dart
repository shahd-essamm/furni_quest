import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/views/recommended_card_item.dart';

class RecommendedGridView extends StatelessWidget {
  const RecommendedGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.9,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        RecommendedCardItem(
          title: 'Brown Chair',
          image: 'assets/BrownChair.png',
          price: 200,
          rating: 4,
        ),
        RecommendedCardItem(
          title: 'Brown Storage',
          image: 'assets/BrownStorage.png',
          price: 100,
          rating: 3,
        ),
        RecommendedCardItem(
          title: 'Vanilla Seat',
          image: 'assets/VanillaSet.png',
          price: 200,
          rating: 4,
        ),
        RecommendedCardItem(
          title: 'White Table',
          image: 'assets/WhiteTable.png',
          price: 200,
          rating: 4,
        ),
        RecommendedCardItem(
          title: 'Wood Bed',
          image: 'assets/WoodBed.png',
          price: 200,
          rating: 5,
        ),
        RecommendedCardItem(
          title: 'Green Sofa',
          image: 'assets/GreenSofa.png',
          price: 200,
          rating: 4,
        ),
      ],
    );
  }
}
