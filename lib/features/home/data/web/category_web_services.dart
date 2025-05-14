import 'package:dio/dio.dart';
import 'package:furni_quest/features/categoris/data/models/category_model.dart';
import 'package:furni_quest/features/home/data/models/category_product_model.dart';
import 'package:furni_quest/features/home/data/models/sub_category_details_model.dart';
import 'package:furni_quest/features/home/data/models/sub_category_model.dart';
import 'package:retrofit/retrofit.dart';

part 'category_web_services.g.dart';

@RestApi(baseUrl: "https://aymantaher.com/Furniture/apis/")
abstract class CategoryWebServices {
  factory CategoryWebServices(Dio dio, {String baseUrl}) = _CategoryWebServices;

  @GET("product/category.php")
  Future<List<SubCategory>> getAllSubCategory();

  @GET("product/category2.php")
  Future<List<SubCategoryDetails>> getAllSubCategoryDetails();

  @GET("product/category3.php")
  Future<List<CategoryModel>> getAllCategory();

  @GET('product/category.php?category_id={category_id}')
  Future<List<SubCategory>> getSubCategoryByCategoryId(
      @Path('category_id') int categoryId);

  @GET('product/category.php')
  Future<List<SubCategoryModel>> getSubCategory();

  @GET('product/productBySub.php')
  Future<List<CategoryProductModel>> getSubCategoryProducts();

  @GET('product/productBySub.php')
  Future<List<CategoryProductModel>> getSubCategoryProductsById(
    @Query('category_id') int categoryId,
  );
  
  @GET('product/productBySub.php')
  Future<CategoryProductModel> getProductById(
    @Query('id') int categoryId,
  );
}
