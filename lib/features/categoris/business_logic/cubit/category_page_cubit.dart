import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_quest/features/categoris/data/models/category_model.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';

part 'category_page_state.dart';

class CategoryPageCubit extends Cubit<CategoryPageState> {
  final CategoryRepo categoryRepo;
  List<CategoryModel> _categories = [];
  List<SubCategoryModel> _subCategories = [];

  CategoryPageCubit(this.categoryRepo) : super(CategoryPageInitial());
  void getAllCategoriesOnly() async {
    emit(CategoryLoading());
    try {
      _categories = await categoryRepo.getAllCategory();
      _subCategories = await categoryRepo.getSubCategory();
      emit(CategoryLoaded(categoryList: _categories, subCategoryModel: _subCategories));
    } catch (e) {
      emit(CategoryError("Failed to load categories"));
    }
  }

  Future<List<SubCategoryModel>> getSubCategoryByCategoryId(int categoryId) async {
    try {
      final subCategory = await categoryRepo.getSubCategoryByCategoryId(categoryId);
      return subCategory;
    } catch (e) {
      return [];
    }
  }

  void getSubCategory() {
    categoryRepo.getSubCategory().then((subCategoryModel) {
      emit(SubCategoryPageloaded(subCategoryModel));
    });
  }
}
