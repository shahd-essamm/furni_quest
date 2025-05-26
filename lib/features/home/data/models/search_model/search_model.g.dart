// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      discription: json['discription'] as String,
      itemId: (json['item_id'] as num).toInt(),
      colorPalette: (json['color_palette'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      categoryId: (json['category_id'] as num).toInt(),
      designCode: json['design_code'] as String,
      subcategoryId: (json['subcategory_id'] as num).toInt(),
      apkUrl: json['apk_url'] as String,
      brand: json['brand'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'discription': instance.discription,
      'item_id': instance.itemId,
      'color_palette': instance.colorPalette,
      'category_id': instance.categoryId,
      'design_code': instance.designCode,
      'subcategory_id': instance.subcategoryId,
      'apk_url': instance.apkUrl,
      'brand': instance.brand,
      'images': instance.images,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      image: json['full_image_url'] as String,
      colorHex: json['color_hex'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'full_image_url': instance.image,
      'color_hex': instance.colorHex,
    };
