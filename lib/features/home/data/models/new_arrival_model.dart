class NewArrivalModel {
  final String productId;
  final String image;

  NewArrivalModel({
    required this.productId,
    required this.image,
  });

  factory NewArrivalModel.fromJson(Map<String, dynamic> json) {
    return NewArrivalModel(
      productId: json['product_id'],
      image: json['image'],
    );
  }
}