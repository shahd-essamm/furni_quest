import 'package:json_annotation/json_annotation.dart';
part 'sub_category_model.g.dart';

@JsonSerializable()
class SubCategory {
  int? id;
  @JsonKey(name:'category_id')
  final int? categoryId;
  String? name;
  @JsonKey(name: "image_url")
  String? image;
  //------------------------------------------------------//
   SubCategory({
    this.id,
    required this.categoryId,
    this.name,
    this.image,
  });
  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}
