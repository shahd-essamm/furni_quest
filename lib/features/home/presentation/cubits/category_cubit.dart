import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';
import 'package:furni_quest/features/home/presentation/cubits/category_state.dart';

class ShopByCategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;

  ShopByCategoryCubit(this.categoryRepo) : super(CategoryInitial());

  void getAllCategory() async {
    emit(ShopByCategoryLoading());
    try {
      final categories = await categoryRepo.getAllCategory();
      emit(ShopByCategorySuccess(categories));
    } catch (e) {
      emit(ShopByCategoryFailure(e.toString()));
    }
  }
}
