import 'package:furni_quest/features/home/data/models/product_model.dart';

abstract class ProductState {}

class RecommendedForYouInitial extends ProductState {}

class RecommendedForYouLoading extends ProductState {}

class RecommendedForYouSuccess extends ProductState {
  final List<ProductModel> product;

  RecommendedForYouSuccess(this.product);
}

class RecommendedForYouFailure extends ProductState {
  final String error;

  RecommendedForYouFailure(this.error);
}
