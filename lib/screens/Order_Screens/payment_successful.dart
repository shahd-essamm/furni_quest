import 'package:flutter/material.dart';
import 'package:furni_quest/screens/Order_Screens/your_receipt.dart';

class PaymentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF3A3E39), size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Payment',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3A3E39),
            fontFamily: 'Heebo',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Color(0xFF657660),
                  child: Icon(
                    Icons.check,
                    size: 96,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Payment Successful',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3A3E39),
                    fontFamily: 'Heebo',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Thank you for your purchase.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF646B62),
                    fontFamily: 'Heebo',
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: 335,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
              //
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF657660),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Heebo',
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => YourReceiptScreen()));
            },
            child: Text(
              'View E-Receipt',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF657660),
                fontFamily: 'Heebo',
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}