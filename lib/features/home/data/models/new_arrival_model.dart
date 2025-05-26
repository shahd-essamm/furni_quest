class NewArrivalModel {
  final int id;
  final String name;
  final int price;
  final String style;
  final String description;
  final int itemId;
  final String colorPalette;
  final int categoryId;
  final String designCode;
  final int subcategoryId;
  final String? apkUrl;
  final String brand;
  final List<NewArrivalImages> images;
  final List<FrequencyBoughtTogether>? frequencyBoughtTogether;
  final List<MoreFromBrandModel>? moreFromBrand;

  NewArrivalModel({
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
    required this.apkUrl,
    required this.brand,
    required this.images,
    required this.frequencyBoughtTogether,
    required this.moreFromBrand,
  });

  factory NewArrivalModel.fromJson(Map<String, dynamic> json) {
    return NewArrivalModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      style: json['style'] ?? '',
      description: json['description'] ?? '',
      itemId: json['item_id'] ?? '',
      colorPalette: json['color_palette'] ?? '',
      categoryId: json['category_id'] ?? 0,
      designCode: json['design_code'] ?? '',
      subcategoryId: json['subcategory_id'] ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((x) => NewArrivalImages.fromJson(x))
              .toList() ??
          [],
      apkUrl: '',
      brand: '',
      frequencyBoughtTogether:
          (json['frequency_brought_together'] as List<dynamic>?)
                  ?.map((x) => FrequencyBoughtTogether.fromJson(x))
                  .toList() ??
              [],
      moreFromBrand: (json['more_from_brand'] as List<dynamic>?)
              ?.map((x) => MoreFromBrandModel.fromJson(x))
              .toList() ??
          [],
    );
  }
}

class NewArrivalImages {
  final int id;
  final String imageUrl;
  final String color;
  final String colorHex;
  NewArrivalImages({
    required this.id,
    required this.imageUrl,
    required this.color,
    required this.colorHex,
  });
  factory NewArrivalImages.fromJson(Map<String, dynamic> json) {
    return NewArrivalImages(
      id: json['id'],
      imageUrl: json['image_url'],
      color: json['color'],
      colorHex: json['color_hex'],
    );
  }
}

class FrequencyBoughtTogether {
  final String? image;
  FrequencyBoughtTogether({required this.image});
  factory FrequencyBoughtTogether.fromJson(Map<String, dynamic> json) {
    return FrequencyBoughtTogether(
      image: json['image_url'] ?? '',
    );
  }
}

class MoreFromBrandModel {
  final String? image;
  final String? name;
  final int? price;
  MoreFromBrandModel(
      {required this.image, required this.name, required this.price});
  factory MoreFromBrandModel.fromJson(Map<String, dynamic> json) {
    return MoreFromBrandModel(
      image: json['image_url'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
    );
  }
}
