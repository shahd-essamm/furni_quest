import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_card.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_deatils_view.dart';
import 'package:furni_quest/features/order/presentation/views/add_card_view.dart';

class CheckoutView extends StatefulWidget {
  final int totalCost;

  static const String routeName = 'checkout';

  const CheckoutView({super.key, required this.totalCost});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedPaymentMethod = 'Cash';
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
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(height: 20),
              Divider(color: Color(0xFFC3C9C0)),
              SizedBox(height: 20),
              _buildItemsYouMightLike(),
              SizedBox(height: 20),
              _buildTotalCostSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemsYouMightLike() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items you might like',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D352B),
          ),
        ),
        SizedBox(height: 10),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 157 / 176.32,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: ProductModel(
                  id: "10",
                  name: 'Bed',
                  price: "100",
                  images: [],
                  description: "ss",
                  style: "ss",
                  categoryId: "",
                  categoryName: "",
                  colorPalette: "",
                  designCode: "",
                  itemId: "",
                  subcategoryId: "",
                  subcategoryName: "",
                ),
                isFavorite: true,
                onFavoritePressed: () {},
              );
            }),
      ],
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
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF232922))),
                Text('20 Street, New Cairo',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6E726C))),
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
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4B5049))),
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
        Text(
          'Your Order',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D352B),
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: [
            Row(
              children: [
                Image.asset(randomItem['image'],
                    width: 50, height: 50, fit: BoxFit.cover),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(randomItem['title'],
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF232922))),
                    Text("Chair | Qty: ${randomItem['quantity']} pcs",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6E726C))),
                    Text("\$${randomItem['price'].toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF232922))),
                    Text("ID Order: 17515cvfvfb",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6E726C))),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  _showAllItems(context);
                },
                child: Text('See all items',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF515E4D))),
              ),
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
                Text('All Items',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ...cartItems.map((item) => ListTile(
                      leading:
                          Image.asset(item['image'], width: 50, height: 50),
                      title: Text(item['title']),
                      subtitle: Text("Qty: ${item['quantity']} pcs"),
                      trailing: Text("\$${item['price'].toStringAsFixed(2)}"),
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF657660),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    minimumSize: Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Back to Checkout"),
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
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3B3A35))),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildPaymentCard(
                'Cash',
                'assets/cash_icon.svg',
                'assets/cash_icon_solid.svg',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _buildPaymentCard(
                'Bank Transfer',
                "assets/bank_trans_icon.svg",
                "assets/bank_trans_icon_solid.svg",
              ),
            ),
          ],
        ),
        if (selectedPaymentMethod == 'Bank Transfer') ...[
          SizedBox(height: 16),
          _buildBankTransferFields(),
        ]
      ],
    );
  }

  Widget _buildBankTransferFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Card Number",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4B5049),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Card Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Expiry Date",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5049),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      hintText: 'MM/YY',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CVV",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5049),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentCard(
    String text,
    String iconPath,
    String iconPathSolid,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = text; // 'Cash' أو 'Bank Transfer'
        });
      },
      child: Container(
        width: 157,
        height: 88,
        decoration: BoxDecoration(
          color:
              selectedPaymentMethod == text ? Color(0xFF868E82) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 3),
              blurRadius: 8,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    selectedPaymentMethod == text ? iconPathSolid : iconPath,
                  ),
                  SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: selectedPaymentMethod == text
                          ? Colors.white
                          : AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                text == 'Cash'
                    ? 'Pay cash when the order\narrives at the destination.'
                    : 'Log in to your online\naccount',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: selectedPaymentMethod == text
                      ? Colors.white
                      : AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalCostSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 10, horizontal: 10), // Adjust padding as needed
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
                  MaterialPageRoute(builder: (context) => AddCardView()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF53634F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
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
