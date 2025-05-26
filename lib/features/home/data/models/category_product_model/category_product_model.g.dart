// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductModel _$CategoryProductModelFromJson(
        Map<String, dynamic> json) =>
    CategoryProductModel(
      (json['frequency_brought_together'] as List<dynamic>?)
          ?.map((e) =>
              FrequencyBoughtTogetherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      style: json['style'] as String?,
      description: json['description'] as String?,
      itemId: (json['item_id'] as num?)?.toInt(),
      colorPalette: json['color_palette'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      designCode: json['design_code'] as String?,
      subcategoryId: (json['subcategory_id'] as num?)?.toInt(),
      apkUrl: json['apk_url'] as String?,
      brand: json['brand'] as String?,
      image: json['image'] as String?,
      moreFromBrand: (json['more_from_brand'] as List<dynamic>?)
          ?.map((e) => MorefromBrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryProductModelToJson(
        CategoryProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'style': instance.style,
      'description': instance.description,
      'item_id': instance.itemId,
      'color_palette': instance.colorPalette,
      'category_id': instance.categoryId,
      'design_code': instance.designCode,
      'subcategory_id': instance.subcategoryId,
      'apk_url': instance.apkUrl,
      'brand': instance.brand,
      'image': instance.image,
      'frequency_brought_together': instance.frequencyBoughtTogether,
      'more_from_brand': instance.moreFromBrand,
    };

FrequencyBoughtTogetherModel _$FrequencyBoughtTogetherModelFromJson(
        Map<String, dynamic> json) =>
    FrequencyBoughtTogetherModel(
      image: json['image'] as String?,
    );

Map<String, dynamic> _$FrequencyBoughtTogetherModelToJson(
        FrequencyBoughtTogetherModel instance) =>
    <String, dynamic>{
      'image': instance.image,
    };

MorefromBrandModel _$MorefromBrandModelFromJson(Map<String, dynamic> json) =>
    MorefromBrandModel(
      image: json['image'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MorefromBrandModelToJson(MorefromBrandModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
    };
