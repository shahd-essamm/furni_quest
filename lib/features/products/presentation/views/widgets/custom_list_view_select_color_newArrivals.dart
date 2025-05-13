import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/data/models/new_arrival_model.dart';

class CustomListViewSelectColorNewarrivals extends StatefulWidget {
  const CustomListViewSelectColorNewarrivals({super.key, required this.hexColors});

  final List<NewArrivalImages> hexColors;

  @override
  State<CustomListViewSelectColorNewarrivals> createState() =>
      _CustomListViewSelectColorNewarrivalsState();
}

class _CustomListViewSelectColorNewarrivalsState
    extends State<CustomListViewSelectColorNewarrivals> {
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
