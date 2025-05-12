// {
//         "id": 21,
//         "name": "Bed Set 2",
//         "price": 1550,
//         "style": "Modern",
//         "description": "Comfortable modern bed set",
//         "item_id": 8,
//         "color_palette": "[\"#C3B4AE\", \"#AFA3A2\", \"#8C7B83\", \"#6C545E\", \"#503D47\", \"#3A2E30\"]",
//         "category_id": 2,
//         "category": "Bedroom",
//         "subcategory_id": 1,
//         "subcategory": "Beds",
//         "design_code": "BED002",
//         "apk_url": null,
//         "brand": "JYSK",
//         "image": "https://aymantaher.com/Furniture/image/bed2.jpg"
//     },


class ProductModel {
  final int id;
  final String name;
  final int price; 
  final String style;
  final String description;
  final int itemId; 
  final String colorPalette;
  final int categoryId;
  final String categoryName;
  final String designCode;
  final int subcategoryId;
  final String subcategoryName;
  final List<ImageModel> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.style,
    required this.description,
    required this.itemId,
    required this.colorPalette,
    required this.categoryId,
    required this.categoryName,
    required this.designCode,
    required this.subcategoryId,
    required this.subcategoryName,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      style: json['style'] ?? '',
      description: json['description'] ?? '',
      itemId: json['item_id'] ?? '',
      colorPalette: json['color_palette'] ?? '',
      categoryId: json['category_id'] ?? 0,
      categoryName: json['category_name'] ?? '',
      designCode: json['design_code'] ?? '',
      subcategoryId: json['subcategory_id'] ?? 0,
      subcategoryName: json['subcategory_name'] ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((x) => ImageModel.fromJson(x))
              .toList() ??
          [],
    );
  }
}

class ImageModel {
  final String imageUrl;
  final String color;
  final String colorHex;

  ImageModel({
    required this.imageUrl,
    required this.color,
    required this.colorHex,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      imageUrl: json['image_url'],
      color: json['color'],
      colorHex: json['color_hex'],
    );
  }
}
