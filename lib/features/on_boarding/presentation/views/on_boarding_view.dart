import 'package:flutter/material.dart';
import 'package:furni_quest/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  static const String routeName = 'onBoarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: OnBoardingViewBody(),
        ),
      ),
    );
  }
}
