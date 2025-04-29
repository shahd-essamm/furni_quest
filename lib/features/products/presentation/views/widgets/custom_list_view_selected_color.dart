import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';

class CustomListViewSelectColorWidget extends StatefulWidget {
  const CustomListViewSelectColorWidget({super.key, required this.hexColors});

  final List<ImageModel> hexColors;

  @override
  State<CustomListViewSelectColorWidget> createState() =>
      _CustomListViewSelectColorWidgetState();
}

class _CustomListViewSelectColorWidgetState
    extends State<CustomListViewSelectColorWidget> {
  int indexSelectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.hexColors.length,
      itemBuilder: (context, index) {
        final bool isSelected = indexSelectedColor == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              indexSelectedColor = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: parseColor(widget.hexColors[index].colorHex),
                  width: 2,
                ),
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: isSelected ? 12 : 20,
                  height: isSelected ? 12 : 20,
                  decoration: BoxDecoration(
                    color: parseColor(widget.hexColors[index].colorHex),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color parseColor(String hexColor) {
    hexColor = hexColor.replaceFirst('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // إضافة alpha
    }
    return Color(int.parse('0x$hexColor'));
  }
}
