// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'category_product_model.g.dart';

@JsonSerializable()
class CategoryProductModel {
  final int? id;
  final String? name;
  final double? price;
  final String? style;
  final String? description;
  @JsonKey(name: 'item_id')
  final int? itemId;
  @JsonKey(name: 'color_palette')
  final String? colorPalette;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @JsonKey(name: 'design_code')
  final String? designCode;
  @JsonKey(name: 'subcategory_id')
  final int? subcategoryId;
  @JsonKey(name: 'apk_url')
  final String? apkUrl;
  final String? brand;
  final String? image;
  @JsonKey(name: 'frequency_brought_together')
  final List<FrequencyBoughtTogetherModel>? frequencyBoughtTogether;
  @JsonKey(name: "more_from_brand")
  final List<MorefromBrandModel>? moreFromBrand;

  CategoryProductModel(
    this.frequencyBoughtTogether, {
    required this.id,
    required this.name,
    required this.price,
    required this.style,
    required this.description,
    required this.itemId,
    required this.colorPalette,
    required this.categoryId,
    required this.designCode,
    required this.subcategoryId,
    this.apkUrl,
    required this.brand,
    required this.image,
    this.moreFromBrand,
  });

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductModelToJson(this);
}

@JsonSerializable()
class FrequencyBoughtTogetherModel {
  final String? image;

  FrequencyBoughtTogetherModel({required this.image});

  factory FrequencyBoughtTogetherModel.fromJson(Map<String, dynamic> json) =>
      _$FrequencyBoughtTogetherModelFromJson(json);

  Map<String, dynamic> toJson() => _$FrequencyBoughtTogetherModelToJson(this);
}

@JsonSerializable()
class MorefromBrandModel {
  String? image;
  String? name;
  int? price;
  MorefromBrandModel({
    required this.image,
    required this.name,
    required this.price,
  });
  factory MorefromBrandModel.fromJson(Map<String, dynamic> json) =>
      _$MorefromBrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$MorefromBrandModelToJson(this);

}
// flutter pub run build_runner build --delete-conflicting-outputs
