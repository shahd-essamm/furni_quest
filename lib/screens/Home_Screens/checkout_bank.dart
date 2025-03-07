import 'package:flutter/material.dart';
import 'package:furni_quest/screens/Order_Screens/add_card.dart';
import 'product_page.dart';

class CheckoutScreen extends StatefulWidget {
  final int totalCost;

  CheckoutScreen({required this.totalCost});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4B5049),
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24, color: Color(0xFF4B5049)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildLocationSection(),
            Divider(color: Color(0xFFC3C9C0)),
            SizedBox(height: 20),
            _buildOrderSection(),
            Divider(color: Color(0xFFC3C9C0)),
            SizedBox(height: 20),
            _buildPaymentMethodSection(),
            SizedBox(height: 320),
            _buildTotalCostSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, size: 24, color: Color(0xFF53634F)),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Home',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF232922))),
                Text('20 Street, New Cairo',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF6E726C))),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 59,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Color(0xFF96A093)),
            ),
            alignment: Alignment.center,
            child: Text('Change',
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF4B5049))),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSection() {
    if (cartItems.isEmpty) return Container();

    final randomItem = (cartItems..shuffle()).first; // Randomly select an item

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Order',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2D352B))),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(randomItem['image'], width: 50, height: 50, fit: BoxFit.cover),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(randomItem['title'],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF232922))),
                    Text("Chair | Qty: ${randomItem['quantity']} pcs",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF6E726C))),
                    Text("\$${randomItem['price'].toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF232922))),
                    Text("ID Order: 17515cvfvfb",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF6E726C))),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                _showAllItems(context);
              },
              child: Text('See all items',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF515E4D))),
            ),
          ],
        ),
      ],
    );
  }

  void _showAllItems(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('All Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ...cartItems.map((item) => ListTile(
                  leading: Image.asset(item['image'], width: 50, height: 50),
                  title: Text(item['title']),
                  subtitle: Text("Qty: ${item['quantity']} pcs"),
                  trailing: Text("\$${item['price'].toStringAsFixed(2)}"),
                )),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Back to Checkout"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF657660),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    minimumSize: Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Method',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF3B3A35))),
        SizedBox(height: 10),
        Row(
          children: [
            _buildPaymentCard('Cash', Icons.money, Colors.white, Color(0xFF4B5049)),
            SizedBox(width: 10),
            _buildPaymentCard('Bank Transfer', Icons.account_balance, Color(0xFF868E82), Color(0xFFEDEDEC)),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentCard(String text, IconData icon, Color bgColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 23),
      child: Container(
        width: 157,
        height: 88,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFF4A5845)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 3),
              blurRadius: 8,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: textColor),
            SizedBox(height: 5),
            Text(text,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, color: textColor)),
            if (text == 'Cash')
              Text('Pay cash when the order\narrives at the destination.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: textColor)),
            if (text == 'Bank Transfer')
              Text('Log in to your online\naccount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: textColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalCostSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Adjust padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Cost',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3A3E39),
                ),
              ),
              SizedBox(height: 5),
              Text(
                '\$${widget.totalCost}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D352B),
                ),
              ),
            ],
          ),
          SizedBox(width: 20), // Add spacing between price and button
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCardScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF53634F),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}