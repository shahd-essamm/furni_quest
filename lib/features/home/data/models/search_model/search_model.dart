import 'package:json_annotation/json_annotation.dart';
part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  final int id;
  final String name;
  final int price;
  final String discription;
  @JsonKey(name: 'item_id')
  final int itemId;
  @JsonKey(name: 'color_palette')
  final List<String> colorPalette;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'design_code')
  final String designCode;
  @JsonKey(name: 'subcategory_id')
  final int subcategoryId;
  @JsonKey(name: 'apk_url')
  final String apkUrl;
  final String brand;
  final List<ImageModel> images;

  SearchModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discription,
    required this.itemId,
    required this.colorPalette,
    required this.categoryId,
    required this.designCode,
    required this.subcategoryId,
    required this.apkUrl,
    required this.brand,
    required this.images,
  });

    factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class ImageModel {
  @JsonKey(name: 'full_image_url')
  final String image;
  @JsonKey(name: 'color_hex')
  final String colorHex;

  ImageModel({
    required this.image,
    required this.colorHex,
  });
      factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
