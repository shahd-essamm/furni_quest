import 'package:furni_quest/features/home/data/models/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final CategoryModel categories;

  CategorySuccess(this.categories);
}

class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure(this.error);
}
