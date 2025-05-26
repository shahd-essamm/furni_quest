import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furni_quest/core/services/injection.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/product_cubit/product_cubit.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/product_cubit/product_state.dart';
import 'package:furni_quest/features/home/data/repos/product_repo.dart';
import 'package:furni_quest/features/order/presentation/views/your_receipt_view.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_card.dart';
import 'package:shimmer/shimmer.dart';

class CheckoutView extends StatefulWidget {
  final int totalCost;
  final List cartItems;

  static const String routeName = 'checkout';

  const CheckoutView({
    super.key,
    required this.totalCost,
    required this.cartItems,
  });

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedPaymentMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
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
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Checkout',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF4B5049),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, size: 24, color: Color(0xFF4B5049)),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget _buildLocationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.location_on, size: 24, color: Color(0xFF53634F)),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF232922),
                  ),
                ),
                Text(
                  '20 Street, New Cairo',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6E726C),
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // TODO: Implement location change
          },
          child: Container(
            width: 59,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Color(0xFF96A093)),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Change',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4B5049),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSection() {
    if (widget.cartItems.isEmpty) return Container();

    final item = widget.cartItems.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Order',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(
                width: 60, height: 60, child: Image.network(item['image'])),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'],
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF232922))),
                Text("Chair | Qty: ${item['quantity']} pcs",
                    style: const TextStyle(
                        fontSize: 12, color: Color(0xFF6E726C))),
                Text("\$${item['price'].toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                const Text("ID Order: 17515cvfvfb",
                    style: TextStyle(fontSize: 12, color: Color(0xFF6E726C))),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => _showAllItems(context),
            child: const Text(
              'See all items',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  void _showAllItems(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'All Items',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...widget.cartItems.map(
                (item) => ListTile(
                  leading: Image.network(item['image'], width: 50, height: 50),
                  title: Text(item['title']),
                  subtitle: Text("Qty: ${item['quantity']} pcs"),
                  trailing: Text("\$${item['price'].toStringAsFixed(2)}"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF657660),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Back to Checkout"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Payment Method',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: _buildPaymentCard('Cash', 'assets/cash_icon.svg',
                    'assets/cash_icon_solid.svg')),
            SizedBox(width: 10),
            Expanded(
                child: _buildPaymentCard(
                    'Bank Transfer',
                    'assets/bank_trans_icon.svg',
                    'assets/bank_trans_icon_solid.svg')),
          ],
        ),
        if (selectedPaymentMethod == 'Bank Transfer') ...[
          SizedBox(height: 16),
          _buildBankTransferFields(),
        ],
      ],
    );
  }

  Widget _buildBankTransferFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabeledField("Card Number", TextInputType.number),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: _buildLabeledField("Expiry Date", TextInputType.datetime,
                    hint: "MM/YY")),
            SizedBox(width: 10),
            Expanded(
                child: _buildLabeledField("CVV", TextInputType.number,
                    obscure: true)),
          ],
        ),
      ],
    );
  }

  Widget _buildLabeledField(String label, TextInputType type,
      {String? hint, bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        TextField(
          keyboardType: type,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentCard(String text, String icon, String selectedIcon) {
    final isSelected = selectedPaymentMethod == text;

    return GestureDetector(
      onTap: () => setState(() => selectedPaymentMethod = text),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 88,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF868E82) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 3),
              blurRadius: 8,
            )
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(isSelected ? selectedIcon : icon),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color:
                            isSelected ? Colors.white : AppColors.primaryColor,
                      )),
                  SizedBox(height: 5),
                  Text(
                    text == 'Cash'
                        ? 'Pay cash when the order arrives.'
                        : 'Log in to your online\nbank account.',
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.white : AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsYouMightLike() {
    return BlocProvider(
      create: (context) => ProductCubit(getIt<ProductRepository>())
        ..getProductRecommendedForYou(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Items you might like',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is RecommendedForYouSuccess) {
                final products = state.product;

                if (products.isEmpty) {
                  return const Text('No items available');
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                      isFavorite: false,
                      onFavoritePressed: () {},
                    );
                  },
                );
              } else if (state is RecommendedForYouLoading) {
                return _buildStateLoading();
              } else {
                return const Text('No items available');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCostSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Cost',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3A3E39),
                ),
              ),
              Text(
                '\$${widget.totalCost}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D352B),
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 220,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => YourReceiptView(
                    cartList: widget.cartItems,
                    totalCost: widget.totalCost,
                  )),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF53634F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildStateLoading() {
  return SizedBox(
    height: 150,
    width: double.infinity,
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: 4,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Container(
          width: 157,
          height: 176.32,
          margin: const EdgeInsets.only(right: 12),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    ),
  );
}
