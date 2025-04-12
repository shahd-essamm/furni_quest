import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
  static const String routeName = 'main-view';
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;

          setState(() {});
        },
      ),
      body: SafeArea(
        child: MainViewBody(currentViewIndex: currentViewIndex),
      ),
    );
  }
}
