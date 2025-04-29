class ShopByCategoryModel {
  final List<Categories> categories;
  ShopByCategoryModel({
    required this.categories,
  });

  factory ShopByCategoryModel.fromJson(Map<String, dynamic> json) {
    return ShopByCategoryModel(
      categories: List<Categories>.from(
        json['categories'].map((x) => Categories.fromJson(x)),
      ),
    );
  }
}

class Categories {
  final String id;
  final String name;
  final String image;

  Categories({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
