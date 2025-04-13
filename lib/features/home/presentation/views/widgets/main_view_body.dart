import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/views/home_view.dart';
import 'package:furni_quest/features/cart/presentation/views/cart_view.dart';
import 'package:furni_quest/features/categoris/presentation/views/categories_view.dart';
import 'package:furni_quest/features/profile/presentation/views/settings_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        CategoriesView(),
        Center(
          child: Text("Scann View"),
        ),
        CartView(),
        SettingsView(),
      ],
    );
  }
}
