import 'package:furni_quest/features/categoris/data/models/category_model.dart';
import 'package:furni_quest/features/home/data/models/category_product_model.dart';
import 'package:furni_quest/features/home/data/models/sub_category_details_model.dart';
import 'package:furni_quest/features/home/data/models/sub_category_model.dart';
import 'package:furni_quest/features/home/data/web/category_web_services.dart';

class CategoryRepo {
  final CategoryWebServices categoryWebServcies;

  CategoryRepo(this.categoryWebServcies);
  Future<List<SubCategory>> getAllSubCategory() async {
    var response = await categoryWebServcies.getAllSubCategory();
    return response
        .map((subCategory) => SubCategory.fromJson(subCategory.toJson()))
        .toList();
  }

  Future<List<SubCategoryDetails>> getAllSubCategoryDetails() async {
    var response = await categoryWebServcies.getAllSubCategoryDetails();
    return response
        .map((subCategoryDetails) =>
            SubCategoryDetails.fromJson(subCategoryDetails.toJson()))
        .toList();
  }

  Future<List<CategoryModel>> getAllCategory() async {
    var response = await categoryWebServcies.getAllCategory();
    return response
        .map((categoryModel) => CategoryModel.fromJson(categoryModel.toJson()))
        .toList();
  }

  Future<List<SubCategoryModel>> getSubCategoryByCategoryId(
      int categoryId) async {
    var response =
        await categoryWebServcies.getSubCategoryByCategoryId(categoryId);
    return response
        .map((subCategoryModel) =>
            SubCategoryModel.fromJson(subCategoryModel.toJson()))
        .toList();
  }

  Future<List<SubCategoryModel>> getSubCategory() async {
    var response = await categoryWebServcies.getSubCategory();
    return response
        .map((subCategoryModel) =>
            SubCategoryModel.fromJson(subCategoryModel.toJson()))
        .toList();
  }

  Future<List<CategoryProductModel>> getSubCategoryProducts() async {
    var response = await categoryWebServcies.getSubCategoryProducts();
    return response
        .map((categoryProductModel) =>
            CategoryProductModel.fromJson(categoryProductModel.toJson()))
        .toList();
  }

 Future<List<CategoryProductModel>> getSubCategoryProductsById(int categoryId) async {
  try {
    final response = await categoryWebServcies.getSubCategoryProductsById(categoryId);
    return response.map((product) => CategoryProductModel.fromJson(product.toJson())).toList();
  } catch (e) {
    throw Exception('Failed to load products: $e');
  }
}

  Future<CategoryProductModel> getProductById(int productId) async {
    var response = await categoryWebServcies.getProductById(productId);
    return response;
  }
}
