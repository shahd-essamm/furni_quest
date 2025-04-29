import 'package:furni_quest/core/services/api_service.dart';
import 'package:furni_quest/core/services/dio_helper.dart';
import 'package:furni_quest/features/auth/signin/data/repository/auth_repo.dart';
import 'package:furni_quest/features/auth/signin/presentation/cubits/auth_cubit.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';
import 'package:furni_quest/features/home/data/repos/new_arrival_repo.dart';
import 'package:furni_quest/features/home/data/repos/product_repo.dart';
import 'package:furni_quest/features/home/presentation/cubits/category_cubit.dart';
import 'package:furni_quest/features/home/presentation/cubits/new_arrival_cubit.dart';
import 'package:furni_quest/features/home/presentation/cubits/product_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerLazySingleton(() => DioHelper.dio);
  getIt.registerLazySingleton(() => ApiServices(getIt()));
  getIt.registerLazySingleton(() => AuthRepository(getIt()));
  getIt.registerFactory(() => AuthCubit(getIt()));

  getIt.registerLazySingleton(() => ProductRepository(getIt()));
  getIt.registerFactory(() => ProductCubit(getIt()));

  getIt.registerLazySingleton(() => CategoryRepo(getIt()));
  getIt.registerFactory(() => ShopByCategoryCubit(getIt()));

  getIt.registerLazySingleton(() => NewArrivalRepo(getIt()));
  getIt.registerFactory(() => NewArrivalCubit(getIt()));
}
