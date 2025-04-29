import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_products_gride_view.dart';

class ProductsOfCategoryView extends StatefulWidget {
  const ProductsOfCategoryView({super.key, required this.products});

  final List<ProductModel> products;

  static const String routeName = 'products_of_category_view';

  @override
  State<ProductsOfCategoryView> createState() => _ProductsOfCategoryViewState();
}

class _ProductsOfCategoryViewState extends State<ProductsOfCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Chair",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Heebo',
            color: Color(0xFF3A3E39),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomProductsGridView(
          products: widget.products,
        ),
      ),
    );
  }
}
