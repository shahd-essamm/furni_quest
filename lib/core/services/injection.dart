// lib/core/service_locator.dart
import 'package:dio/dio.dart';
import 'package:furni_quest/core/services/api_service.dart';
import 'package:furni_quest/features/auth/signin/data/repository/auth_repo.dart';
import 'package:furni_quest/features/auth/signin/presentation/cubits/auth_cubit.dart';
import 'package:furni_quest/features/categoris/business_logic/cubit/category_page_cubit.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/new_arrival_cubit/new_arrival_cubit.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/product_cubit/product_cubit.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:furni_quest/features/home/data/repos/new_arrival_repo.dart';
import 'package:furni_quest/features/home/data/repos/product_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:furni_quest/features/home/data/web/category_web_services.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/category_cubit/category_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<Dio>(() => createAndSetupDio());
  getIt.registerLazySingleton<CategoryWebServices>(() => CategoryWebServices(getIt<Dio>()));
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt<CategoryWebServices>()));
  getIt.registerLazySingleton<CategoryCubit>(() => CategoryCubit(getIt<CategoryRepo>()));
  getIt.registerLazySingleton<CategoryPageCubit>(() => CategoryPageCubit(getIt<CategoryRepo>()));
  getIt.registerLazySingleton(() => ApiServices(getIt()));
  getIt.registerLazySingleton(() => AuthRepository(getIt()));
  getIt.registerFactory(() => AuthCubit(getIt()));
  getIt.registerLazySingleton(() => ProductRepository(getIt()));
  getIt.registerFactory(() => ProductCubit(getIt()));
  getIt.registerLazySingleton(() => NewArrivalRepo(getIt()));
  getIt.registerFactory(() => NewArrivalCubit(getIt()));
  getIt.registerLazySingleton<WishlistCubit>(()=>WishlistCubit());
}

Dio createAndSetupDio() {
  final dio = Dio();
  dio.options
    ..connectTimeout = const Duration(seconds: 20)
    ..receiveTimeout = const Duration(seconds: 20);

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
  ));

  return dio;
}
