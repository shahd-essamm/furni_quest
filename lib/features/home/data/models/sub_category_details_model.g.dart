// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryDetails _$SubCategoryDetailsFromJson(Map<String, dynamic> json) =>
    SubCategoryDetails(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      style: json['style'] as String?,
      description: json['description'] as String?,
      itemId: (json['itemId'] as num?)?.toInt(),
      colorPalette: json['colorPalette'] as List<dynamic>?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      subcategoryId: (json['subcategoryId'] as num?)?.toInt(),
      subcategoryName: json['subcategoryName'] as String?,
      designCode: json['designCode'] as String?,
      brand: json['brand'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SubCategoryDetailsToJson(SubCategoryDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'style': instance.style,
      'description': instance.description,
      'itemId': instance.itemId,
      'colorPalette': instance.colorPalette,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'subcategoryId': instance.subcategoryId,
      'subcategoryName': instance.subcategoryName,
      'designCode': instance.designCode,
      'brand': instance.brand,
      'image': instance.image,
    };
