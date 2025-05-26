import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/core/helper_functions/app_router.dart';
import 'package:furni_quest/core/services/custom_bloc_observer.dart';
import 'package:furni_quest/core/services/injection.dart';
import 'package:furni_quest/core/services/shared_preferences_singleton.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:furni_quest/features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();

  await Prefs.init();
  initGetIt();
  // setupGetit();
  runApp(FurniQuest(appRouter: AppRouter()));
}

class FurniQuest extends StatelessWidget {
  final AppRouter appRouter;
  const FurniQuest({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
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
      ),
    );
  }
}
