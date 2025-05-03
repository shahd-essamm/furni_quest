import 'package:flutter/material.dart';
import 'package:furni_quest/core/helper_functions/hex_to_flutter_code.dart';

class ColorPaletteRow extends StatelessWidget {
  final List<String> colorOptions;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const ColorPaletteRow({
    super.key,
    required this.colorOptions,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          onChanged: onChanged,
        ),
        const SizedBox(width: 4),
        Row(
          children: List.generate(
            colorOptions.length,
            (index) => Container(
              height: 44,
              width: 51,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight:
                      Radius.circular(index == colorOptions.length - 1 ? 8 : 0),
                  bottomRight:
                      Radius.circular(index == colorOptions.length - 1 ? 8 : 0),
                  topLeft: Radius.circular(index == 0 ? 8 : 0),
                  bottomLeft: Radius.circular(index == 0 ? 8 : 0),
                ),
                color: Color(int.parse(hexToFlutterColor(colorOptions[index]))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
