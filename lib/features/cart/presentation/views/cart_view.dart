import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/screens/home_view.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_deatils_view.dart';

// Use the global cart list
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int getTotalPrice() {
    int total = 0;
    for (var item in cartItems) {
      total += ((item['price'] as num) * (item['quantity'] as int)).toInt();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color set to white
      appBar: AppBar(
        title: Center(
          // Title centered
          child: Text(
            "My Cart",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3A3E39)),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: cartItems.isEmpty ? _buildEmptyCart() : _buildCartWithItems(),
    );
  }

  Widget _buildEmptyCart() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              CrossAxisAlignment.center, // لتوسيط المحتوى أفقيًا
          children: [
            SizedBox(height: 100),
            SizedBox(
              width: 178,
              height: 244,
              child: Image.asset(
                  'assets/EmptyCart_image/EmptyCart.png'), // استبدل بالصورة الخاصة بك
            ),
            SizedBox(height: 20),
            Text(
              "Your cart is empty!",
              style: TextStyle(
                fontFamily: 'Heebo',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3A3E39),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "You have no items in your shopping cart.\nLet’s go buy something",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Heebo',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF646B62),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 264,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF657660),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
// انتقل إلى الصفحة المطلوبة عند الضغط على الزر
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
                },
                child: Text(
                  "Continue Shopping",
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartWithItems() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Dismissible(
                key: Key(item['title']),
                direction: DismissDirection.endToStart,
                background: Container(
                  width: 68, // Set the width for dismiss area
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                confirmDismiss: (direction) async {
                  return await showModalBottomSheet<bool>(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Remove from Cart?",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2D352B),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 50,
                              child: Image.network(
                                item['image'],
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(item['title'],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF232922))),
                            Text("${item['price'].toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF232922))),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: Text("Cancel",
                                      style:
                                          TextStyle(color: Color(0xFF657660))),
                                ),
                                ElevatedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text("Yes, Remove"),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(0xFF657660),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    minimumSize: Size(157, 44),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                onDismissed: (direction) {
                  setState(() {
                    cartItems.removeAt(index);
                  });
                },
                child: _buildCartItem(item),
              );
            },
          ),
        ),
        _buildCartSummary()
      ],
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    item['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade200,
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF232922)),
                      ),
                      Text("Chair | Qty: ${item['quantity']} pcs",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6E726C))),
                      Text("${item['price'].toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF232922))),
                    ],
                  ),
                ),
                _buildQuantityControls(item),
              ],
            ),
            SizedBox(height: 8),
            Divider(color: Color(0xFFC3C9C0)), // Line separator
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControls(Map<String, dynamic> item) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.end, // Align the buttons to the right
      children: [// Adding the "minus" button (adjusted to center the icon)
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Color(0xFFE8EAE7), // Light gray color for "-"
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            // Centering the minus icon
            child: IconButton(
              icon: Icon(Icons.remove, color: Colors.black, size: 16),
              onPressed: () {
                setState(() {
                  if (item['quantity'] > 1) {
                    item['quantity']--;
                  } else {
                    cartItems.remove(item);
                  }
                });
              },
            ),
          ),
        ),
        SizedBox(width: 8), // Space between the buttons
        Text("${item['quantity']}",
            style: TextStyle(fontSize: 16, color: Color(0xFF3A3E39))),
        SizedBox(width: 8), // Space between the buttons
// Adding the "plus" button (adjusted to center the icon)
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Color(0xFF515E4D), // Green color for "+"
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            // Centering the plus icon
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white, size: 16),
              onPressed: () {
                setState(() {
                  item['quantity']++;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartSummary() {
    int subtotal = getTotalPrice();
    int deliveryFee = 35;
    int discount = -40;
    int totalCost = subtotal + deliveryFee + discount;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          _buildSummaryRow("Sub-Total", subtotal),
          _buildSummaryRow("Delivery Fee", deliveryFee),
          _buildSummaryRow("Discount", discount),
          Divider(color: Color(0xFFC3C9C0)),
          _buildSummaryRow("Total Cost", totalCost, isBold: true),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              //TODO : Handle checkout action
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Chec()));
              // Handle checkout logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF657660),
              padding: EdgeInsets.symmetric(vertical: 14),
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("Proceed to Checkout",
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, int value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: Color(0xFF3A4537))),
          Text("${value}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: Color(0xFF2D352B))),
        ],
      ),
    );
  }
}
