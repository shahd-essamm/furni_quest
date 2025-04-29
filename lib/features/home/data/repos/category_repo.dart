import 'package:furni_quest/core/services/api_ocnstants.dart';
import 'package:furni_quest/core/services/api_service.dart';
import 'package:furni_quest/features/home/data/models/category_model.dart';

class CategoryRepo {
  final ApiServices api;

  CategoryRepo(this.api);

  Future<ShopByCategoryModel> getAllCategory() async {
    final response = await api.getData(
      endpoint: ApiConstants.shopByCategory,
    );

    return ShopByCategoryModel.fromJson(response.data);
  }
}
