import 'package:flutter/material.dart';

class CustomListViewSelectColorWidget extends StatefulWidget {
  const CustomListViewSelectColorWidget({super.key, required this.colors});

  final List<Color> colors;

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
      itemCount: widget.colors.length,
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
                  color: widget.colors[index],
                  width: 2,
                ),
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: isSelected ? 12 : 20,
                  height: isSelected ? 12 : 20,
                  decoration: BoxDecoration(
                    color: widget.colors[index],
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
}
