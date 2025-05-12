import 'package:furni_quest/core/services/api_constans.dart';
import 'package:furni_quest/core/services/api_service.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';

class ProductRepository {
  final ApiServices api;

  ProductRepository(this.api);

  Future<List<ProductModel>> getProductRecommendedForYou() async {
    final response = await api.getData(
      endpoint: ApiConstants.recommendedForYou,
    );

    return List<ProductModel>.from(
      response.data.map(
        (x) => ProductModel.fromJson(x),
      ),
    );
  }
}
