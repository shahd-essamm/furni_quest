import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset(
          'assets/UrOurDesign.png',
          fit: BoxFit.fitWidth,
        ),
        Image.asset(
          'assets/BedRoom.jpeg',
          fit: BoxFit.fitWidth,
        ),
        Image.asset(
          'assets/LivingRoom.jpeg',
          fit: BoxFit.fitWidth,
        ),
      ],
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
