import 'package:flutter/material.dart';
import 'package:furni_quest/core/helper_functions/on_generate_routes.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/features/splash/presentation/views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FurniQuest());
}

class FurniQuest extends StatelessWidget {
  const FurniQuest({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      theme: ThemeData(
        fontFamily: 'Heebo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          secondary: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
    );
  }
}
