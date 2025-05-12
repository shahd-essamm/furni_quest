import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_quest/features/home/data/models/category_product_model.dart';
import 'package:furni_quest/features/home/data/models/sub_category_model.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;
  List <SubCategory> _subCategory = [];
  late CategoryProductModel productId;
  List<CategoryProductModel> _categoryProductModel = [];
  CategoryCubit(this.categoryRepo) : super(CategoryPacakgeInitial());



/*  void getAllNewArrival() async {
    emit(NewArrivalLoading());
    try {
      final allNewArrival = await newArrivalRepo.getAllNewArrival();
      emit(NewArrivalSuccess(allNewArrival));
    } catch (e) {
      emit(NewArrivalFailure(e.toString()));
    }
  } */

void getAllSubCategory() async {
  emit(CategoryLoading());
  try {
    final subCategories = await categoryRepo.getAllSubCategory();
    final products = await categoryRepo.getSubCategoryProducts();
    emit(SubCategoriesLoaded(subCategories, products));
  } catch (e) {
    emit(CategoryError(e.toString()));
  }
}
  

  void getSubCategory() {
    categoryRepo.getAllSubCategoryDetails().then((subCategoryDetailsList) {
      emit(SubCategoriesDetailsLoaded(subCategoryDetailsList));
    });
  }

  void getSubCategoryProducts() {
    categoryRepo.getSubCategoryProducts().then((subCategoryProductsList) {
      emit(SubCategoryProductsLoaded(subCategoryProductsList));
    });
  }

  // void getSubCategoryProductsById(int categoryId)async{
  //   emit(CategoryLoading());
  //   final products = await categoryRepo.getSubCategoryProductsById(categoryId);
  //   categoryRepo.getSubCategoryProductsById(categoryId).then((subCategoryProductsList){
  //     emit(SubCategoryProductsLoaded(subCategoryProductsList));
  //   });
  // }
  Future<void> getSubCategoryProductsById(int categoryId) async {
    emit(CategoryLoading());
    try {
      final products =
          await categoryRepo.getSubCategoryProductsById(categoryId);
      emit(SubCategoryProductsLoaded(products));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  Future <void> getProductById(int productId) async {
    emit(CategoryLoading());
    try{
      final product = await categoryRepo.getProductById(productId);
      emit(CategoryProductLoaded(product));
    }catch (e){
      emit(CategoryError(e.toString()));
    }
  }
}
