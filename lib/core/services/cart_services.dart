// lib/services/cart_service.dart

class CartItem {
  final String title;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }
}

class CartService {
  static final List<Map<String, dynamic>> cartItems = [];

  static void addToCart(CartItem item) {
    print('Adding to cart: ${item.toMap()}'); // Debug print
    cartItems.add(item.toMap());
  }

  static double getTotalPrice() {
    return cartItems.fold(0, (total, item) => 
      total + (item['price'] as double) * (item['quantity'] as int));
  }
}
