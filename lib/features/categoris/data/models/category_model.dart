// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';
@JsonSerializable()
class CategoryModel {
  int? id;
  String? name;
  @JsonKey(name: 'image_url')
  String? image;
  List<SubCategoryModel>? subCategories;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.subCategories
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  


}
@JsonSerializable()
class SubCategoryModel {
  int? id;
  String? name;
  @JsonKey(name: 'image_url')
  String? image;

  SubCategoryModel({this.id, this.name, this.image});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}
