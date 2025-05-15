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
// flutter pub run build_runner build --delete-conflicting-outputs