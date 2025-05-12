// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:furni_quest/features/home/data/web/category_web_servcies.dart';
// import 'package:furni_quest/core/services/get_it_service.dart';
// import 'package:furni_quest/features/auth/forgot_password.dart/presentation/views/forgot_password_view.dart';
// import 'package:furni_quest/features/auth/forgot_password.dart/presentation/views/widgets/new_pass_view.dart';
// import 'package:furni_quest/features/auth/forgot_password.dart/presentation/views/widgets/verify_view.dart';
// import 'package:furni_quest/features/auth/signin/data/repository/auth_repo.dart';
// import 'package:furni_quest/features/auth/signin/presentation/cubits/auth_cubit.dart';
// import 'package:furni_quest/features/auth/signin/presentation/views/signin_view.dart';
// import 'package:furni_quest/features/auth/signup/presentation/views/signup_buss_view.dart';
// import 'package:furni_quest/features/auth/signup/presentation/views/signup_view.dart';
// import 'package:furni_quest/features/home/data/repos/category_repo.dart';
// import 'package:furni_quest/features/home/bussniss_logic/cubits/category_cubit/category_package_cubit.dart';
// import 'package:furni_quest/features/home/presentation/screens/home_view.dart';
// import 'package:furni_quest/features/home/presentation/screens/main_view.dart';
// import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/camera_view.dart';
// import 'package:furni_quest/features/home/presentation/widgets/wish_list_view.dart';
// import 'package:furni_quest/features/notifications/presentation/views/empty_notification_view.dart';
// import 'package:furni_quest/features/on_boarding/presentation/views/on_boarding_view.dart';
// import 'package:furni_quest/features/profile/presentation/views/profile_view.dart';
// import 'package:furni_quest/features/profile/presentation/views/settings_view.dart';
// import 'package:furni_quest/features/search/presentation/views/search_view.dart';
// import 'package:furni_quest/features/splash/presentation/views/splash_view.dart';

// Route<dynamic> onGenerateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case SplashView.routeName:
//       return MaterialPageRoute(builder: (context) => const SplashView());
//     case OnBoarding.routeName:
//       return MaterialPageRoute(builder: (context) => const OnBoarding());
//     case MainView.routeName:
//       return MaterialPageRoute(
//         builder: (context) => BlocProvider(
//           create: (context) => CategoryPacakgeCubit(
//             CategoryRepo(
//               CategoryWebServcies(),
//             ),
//           ),
//           child: const MainView(),
//         ),
//       );
//     case HomeView.routeName:
//       return MaterialPageRoute(builder: (context) => const HomeView());
//     case WishListView.routeName:
//       return MaterialPageRoute(builder: (context) => const WishListView());
//     case CameraView.routeName:
//       return MaterialPageRoute(builder: (context) => const CameraView());
//     case SignInView.routeName:
//       return MaterialPageRoute(
//         builder: (context) => BlocProvider(
//           create: (context) => AuthCubit(
//             getIt.get<AuthRepository>(),
//           ),
//           child: const SignInView(),
//         ),
//       );
//     case SignupView.routeName:
//       return MaterialPageRoute(builder: (context) => const SignupView());
//     case VerifyView.routeName:
//       return MaterialPageRoute(
//         builder: (context) => VerifyView(
//           isNewPassword: settings.arguments as bool,
//         ),
//       );
//     case NewPasswordView.routeName:
//       return MaterialPageRoute(builder: (context) => const NewPasswordView());
//     case EmptyNotificationsView.routeName:
//       return MaterialPageRoute(
//           builder: (context) => const EmptyNotificationsView());
//     case SignupBusinessView.routeName:
//       return MaterialPageRoute(
//           builder: (context) => const SignupBusinessView());
//     case SettingsView.routeName:
//       return MaterialPageRoute(builder: (context) => const SettingsView());
//     case ForgotPasswordView.routeName:
//       return MaterialPageRoute(
//           builder: (context) => const ForgotPasswordView());
//     case ProfileView.routeName:
//       return MaterialPageRoute(builder: (context) => const ProfileView());
//     case SearchView.routeName:
//       return MaterialPageRoute(builder: (context) => const SearchView());

//     default:
//       return MaterialPageRoute(builder: (context) => const Scaffold());
//   }
// }
