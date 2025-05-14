part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryPacakgeInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class SubCategoryProductsLoaded extends CategoryState {
  final List<CategoryProductModel> products;

  const SubCategoryProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}


class SubCategoriesLoaded extends CategoryState {
  final List<SubCategory> subCategories;
  final List<CategoryProductModel> categoryProducts;
  const SubCategoriesLoaded(this.subCategories, this.categoryProducts);

  @override
  List<Object?> get props => [subCategories];
}
class CategoryProductLoaded extends CategoryState{
  final CategoryProductModel categoryProductModel;
  const CategoryProductLoaded(this.categoryProductModel);

}

class SubCategoriesDetailsLoaded extends CategoryState {
  final List<dynamic> subCategoryDetails;

  const SubCategoriesDetailsLoaded(this.subCategoryDetails);

  @override
  List<Object?> get props => [subCategoryDetails];
}

class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);
}
