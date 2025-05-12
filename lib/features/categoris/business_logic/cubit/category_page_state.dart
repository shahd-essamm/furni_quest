part of 'category_page_cubit.dart';

sealed class CategoryPageState extends Equatable {
  const CategoryPageState();

  @override
  List<Object> get props => [];
}

final class CategoryPageInitial extends CategoryPageState {}

final class CategoryLoading extends CategoryPageState {}

final class CategoryLoaded extends CategoryPageState {
  final List<CategoryModel> categoryList;
  final List<SubCategoryModel> subCategoryModel; // optional now
  const CategoryLoaded({required this.categoryList, required this.subCategoryModel});

}

final class CategoryError extends CategoryPageState {
  final String message;
  const CategoryError(this.message);}

class GetCategoryByCategoryId extends CategoryPageState {
  final SubCategoryModel category;
  const GetCategoryByCategoryId(this.category);
}

class SubCategoryPageloaded extends CategoryPageState {
  final List<SubCategoryModel> subCategoryModel;
  const SubCategoryPageloaded(this.subCategoryModel);
}