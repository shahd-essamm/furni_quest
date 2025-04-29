import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/active_item.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/in_active_item.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.icon,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.icon,
          );
  }
}
