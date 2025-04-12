import 'package:flutter/material.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});

  final Widget image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: image,
    );
  }
}
