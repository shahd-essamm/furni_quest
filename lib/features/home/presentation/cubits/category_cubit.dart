import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';
import 'package:furni_quest/features/home/presentation/cubits/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryCubit(this.categoryRepo) : super(CategoryInitial());

  void getAllCategory() async {
    emit(CategoryLoading());
    try {
      final categories = await categoryRepo.getAllCategory();
      emit(CategorySuccess(categories));
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }
}
