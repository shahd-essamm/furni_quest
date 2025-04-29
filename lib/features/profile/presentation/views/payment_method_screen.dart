import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodScreen extends StatelessWidget {
  final List<PaymentMethod> methods = [
    PaymentMethod('Paypal', 'assets/account_image/PayPal.svg'),
    PaymentMethod('Credit Card', 'assets/account_image/Mastercard.svg'),
    PaymentMethod('InstaPay', 'assets/account_image/PayPal.svg'),
    PaymentMethod('Apple Pay', 'assets/account_image/Apple.svg'),
    PaymentMethod('Google Pay', 'assets/account_image/Google.svg'),
  ];

  PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Payment Method',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(0xFF3A3E39),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28),
            Text(
              'Select Your Payment Method',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF4B5049),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: methods.length,
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final method = methods[index];
                  return PaymentMethodTile(
                    title: method.title,
                    iconPath: method.iconPath,
                    onTap: () {
                      // Add your selection logic here
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod {
  final String title;
  final String iconPath;

  PaymentMethod(this.title, this.iconPath);
}

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 44,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFC3C9C0)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF3A3E39),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Color(0xFF3A3E39),
            ),
          ],
        ),
      ),
    );
  }
}
