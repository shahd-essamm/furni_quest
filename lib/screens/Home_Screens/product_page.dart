// import 'package:flutter/material.dart';
//
// import 'Empty_cart.dart';
//
// // Global cart list
// List<Map<String, dynamic>> cartItems = [];
//
//
//
// class CartScreen extends StatelessWidget {
//   int getTotalPrice() {
//     int total = 0;
//     for (var item in cartItems) {
//       total += ((item['price'] as num) * (item['quantity'] as int)).toInt();
//     }
//     return total;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Cart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF3A3E39))),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: cartItems.isEmpty
//           ? EmptyCartPage() // إذا كانت السلة فارغة، نعرض صفحة EmptyCartPage
//           : _buildCartWithItems(),
//     );
//   }
//
//   Widget _buildCartWithItems() {
//     return ListView.builder(
//       itemCount: cartItems.length,
//       itemBuilder: (context, index) {
//         final item = cartItems[index];
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Row(
//             children: [
//               Image.asset(item['image'], width: 80, height: 80, fit: BoxFit.cover),
//               SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item['title'],
//                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF232922)),
//                     ),
//                     Text("Chair | Qty: ${item['quantity']} pcs", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF6E726C))),
//                     Text("\$${item['price'].toStringAsFixed(2)}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF232922))),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//


import 'package:flutter/material.dart';

// Global cart list
List<Map<String, dynamic>> cartItems = [];

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final String image;
  final double price;
  final int rating;

  ProductDetailsScreen({
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(image, height: 200),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '\$${price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color: index < rating ? Colors.amber : Colors.grey,
                  );
                }),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "This is a luxurious armchair with a sleek metal frame. "
                    "Perfect for adding a touch of luxury to your living space.",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  cartItems.add({
                    'title': title,
                    'image': image,
                    'price': price,
                    'quantity': 1,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added to cart')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}