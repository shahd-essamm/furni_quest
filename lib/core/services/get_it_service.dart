// import 'package:dio/dio.dart';
// import 'package:furni_quest/core/services/api_service.dart';
// import 'package:furni_quest/features/home/data/web/category_web_services.dart';
// import 'package:furni_quest/features/auth/signin/data/repository/auth_repo.dart';
// import 'package:furni_quest/features/auth/signin/presentation/cubits/auth_cubit.dart';
// import 'package:furni_quest/features/home/data/repos/category_repo.dart';
// import 'package:furni_quest/features/home/data/repos/new_arrival_repo.dart';
// import 'package:furni_quest/features/home/data/repos/product_repo.dart';
// import 'package:furni_quest/features/home/bussniss_logic/cubits/category_cubit/category_cubit.dart';
// import 'package:furni_quest/features/home/bussniss_logic/cubits/new_arrival_cubit/new_arrival_cubit.dart';
// import 'package:furni_quest/features/home/bussniss_logic/cubits/product_cubit/product_cubit.dart';
// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;
// final sl = GetIt.instance;
// void setupGetit() {
//   // getIt.registerLazySingleton(() => DioHelper.dio);
//   // getIt.registerFactory(() => ShopByCategoryCubit(getIt()));
//   getIt.registerLazySingleton(() => ApiServices(getIt()));
//   getIt.registerLazySingleton(() => AuthRepository(getIt()));
//   getIt.registerFactory(() => AuthCubit(getIt()));
//   getIt.registerLazySingleton(() => ProductRepository(getIt()));
//   getIt.registerFactory(() => ProductCubit(getIt()));
//   getIt.registerLazySingleton(() => CategoryRepo(getIt()));
//   getIt.registerLazySingleton(() => NewArrivalRepo(getIt()));
//   getIt.registerFactory(() => NewArrivalCubit(getIt()));
//   sl.registerLazySingleton<Dio>(() => Dio());
// }
