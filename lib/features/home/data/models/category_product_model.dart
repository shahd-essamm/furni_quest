import 'package:json_annotation/json_annotation.dart';


part 'category_product_model.g.dart';
@JsonSerializable()
class CategoryProductModel {
  final int id;
  final String name;
  final double price;
  final String style;
  final String description;
  @JsonKey(name: 'item_id')
  final int itemId;
  @JsonKey(name: 'color_palette')
  final String colorPalette;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'design_code')
  final String designCode;
  @JsonKey(name: 'subcategory_id')
  final int subcategoryId;
  @JsonKey(name: 'apk_url')
  final String? apkUrl;
  final String brand;
  final List <ImageModel> images;

  CategoryProductModel({
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
    required this.images,
  });

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductModelToJson(this);
}

@JsonSerializable()
class ImageModel{
  @JsonKey(name:'url')
  final String image;
  final String color;
  @JsonKey(name:'color_hex')
  final String colorHex;


  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  ImageModel({required this.image, required this.color, required this.colorHex});

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}