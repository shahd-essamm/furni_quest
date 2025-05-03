import 'package:flutter/material.dart';
import 'package:furni_quest/core/utils/app_colors.dart';

Widget buildChips(
    List<String> options, String selected, Function(String) onChanged) {
  return Wrap(
    spacing: 8,
    children: options.map((option) {
      final isSelected = option == selected;
      return ChoiceChip(
        label: Text(option),
        backgroundColor: Colors.white,
        selected: isSelected,
        onSelected: (_) => onChanged(option),
        selectedColor: Colors.white,
        labelStyle: TextStyle(
          color: isSelected ? AppColors.primaryColor : Colors.grey[400]!,
        ),
        side: BorderSide(
          color: isSelected ? AppColors.primaryColor : Colors.grey[400]!,
          width: 1.0,
        ),
        showCheckmark: false,
      );
    }).toList(),
  );
}
