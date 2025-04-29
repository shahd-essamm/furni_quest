import 'package:furni_quest/features/home/data/models/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class ShopByCategoryLoading extends CategoryState {}

class ShopByCategorySuccess extends CategoryState {
  final ShopByCategoryModel categories;

  ShopByCategorySuccess(this.categories);
}

class ShopByCategoryFailure extends CategoryState {
  final String error;

  ShopByCategoryFailure(this.error);
}
