import 'package:json_annotation/json_annotation.dart';
part 'sub_category_details_model.g.dart';
@JsonSerializable()
class SubCategoryDetails {
  int? id;
  String? name;
  int? price;
  String? style;
  String? description;
  int? itemId;
  List? colorPalette;
  int? categoryId;
  String? categoryName;
  int? subcategoryId;
  String? subcategoryName;
  String? designCode;
  String? brand;
  String? image;


  SubCategoryDetails({
    required this.id,
    required this.name,
    required this.price,
    required this.style,
    required this.description,
    required this.itemId,
    required this.colorPalette,
    required this.categoryId,
    required this.categoryName,
    required this.subcategoryId,
    required this.subcategoryName,
    required this.designCode,
    required this.brand,
    required this.image,
  });

    factory SubCategoryDetails.fromJson(Map<String, dynamic> json) => _$SubCategoryDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$SubCategoryDetailsToJson(this);


}
