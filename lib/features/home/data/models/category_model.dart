class CategoryModel {
  final List<Categories> categories;
  CategoryModel({
    required this.categories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categories: List<Categories>.from(
        json['categories'].map((x) => Categories.fromJson(x)),
      ),
    );
  }
}

class Categories {
  final String id;
  final String name;
  final String imageUrl;

  Categories({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }
}
