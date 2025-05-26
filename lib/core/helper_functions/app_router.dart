import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/core/services/injection.dart';
import 'package:furni_quest/features/auth/forgot_password.dart/presentation/views/forgot_password_view.dart';
import 'package:furni_quest/features/auth/forgot_password.dart/presentation/views/widgets/new_pass_view.dart';
import 'package:furni_quest/features/auth/forgot_password.dart/presentation/views/widgets/verify_view.dart';
import 'package:furni_quest/features/auth/signin/data/repository/auth_repo.dart';
import 'package:furni_quest/features/auth/signin/presentation/cubits/auth_cubit.dart';
import 'package:furni_quest/features/auth/signin/presentation/views/signin_view.dart';
import 'package:furni_quest/features/auth/signup/presentation/views/signup_buss_view.dart';
import 'package:furni_quest/features/auth/signup/presentation/views/signup_view.dart';
import 'package:furni_quest/features/categoris/business_logic/cubit/category_page_cubit.dart';
import 'package:furni_quest/features/categoris/presentation/screens/categories_view.dart';
import 'package:furni_quest/features/discovery/presentation/views/recommendation_view.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/category_cubit/category_cubit.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/product_cubit/product_cubit.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';
import 'package:furni_quest/features/home/data/web/category_web_services.dart';
import 'package:furni_quest/features/home/presentation/screens/home_view.dart';
import 'package:furni_quest/features/home/presentation/screens/main_view.dart';
import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/camera_view.dart';
import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/wish_list_view.dart';
import 'package:furni_quest/features/notifications/presentation/views/empty_notification_view.dart';
import 'package:furni_quest/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:furni_quest/features/profile/presentation/views/profile_view.dart';
import 'package:furni_quest/features/profile/presentation/views/settings_view.dart';
import 'package:furni_quest/features/search/presentation/views/search_view.dart';
import 'package:furni_quest/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  late CategoryRepo categoryRepo;
  late CategoryCubit categoryCubit;
  AppRouter() {
    categoryRepo = CategoryRepo(CategoryWebServices(getIt.get()));
    categoryCubit = CategoryCubit(categoryRepo);
  }
//-----------------------------------------------------------------------------------//
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case OnBoarding.routeName:
        return MaterialPageRoute(builder: (context) => const OnBoarding());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case MainView.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CategoryCubit(categoryRepo),
            child: const MainView(),
          ),
        );
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case HomeView.routeName:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CategoryCubit(categoryRepo),
              ),
              BlocProvider(
                create: (context) => getIt<WishlistCubit>(),
              ),
            ],
            child: const HomeView(),
          ),
        );
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case WishListView.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => WishlistCubit(),
            child: const WishListView(),
          ),
        );
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case CategoriesView.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt<CategoryPageCubit>(),
              child: const CategoriesView(),
            );
          },
        );
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case CameraView.routeName:
        return MaterialPageRoute(builder: (context) => const CameraView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case SignInView.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(
              getIt.get<AuthRepository>(),
            ),
            child: const SignInView(),
          ),
        );
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case SignupView.routeName:
        return MaterialPageRoute(builder: (context) => const SignupView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case VerifyView.routeName:
        return MaterialPageRoute(
          builder: (context) => VerifyView(
            isNewPassword: settings.arguments as bool,
          ),
        );
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case NewPasswordView.routeName:
        return MaterialPageRoute(builder: (context) => const NewPasswordView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case EmptyNotificationsView.routeName:
        return MaterialPageRoute(
            builder: (context) => const EmptyNotificationsView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case SignupBusinessView.routeName:
        return MaterialPageRoute(
            builder: (context) => const SignupBusinessView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case SettingsView.routeName:
        return MaterialPageRoute(builder: (context) => const SettingsView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case ForgotPasswordView.routeName:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case ProfileView.routeName:
        return MaterialPageRoute(builder: (context) => const ProfileView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case SearchView.routeName:
        return MaterialPageRoute(builder: (context) => const SearchView());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
      case RecommendationView.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<ProductCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<WishlistCubit>(),
                ),
              ],
              child: const RecommendationView(),
            );
          },
        );
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//

      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
    }
  }
}
