class ProductModel {
  final String id;
  final String name;
  final String price;
  final String style;
  final String description;
  final String mainImage;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.style,
    required this.description,
    required this.mainImage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      style: json['style'],
      description: json['description'],
      mainImage: json['main_image'],
    );
  }
}
