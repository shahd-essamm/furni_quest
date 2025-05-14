import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/category_cubit/category_cubit.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_card.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_deatils_view.dart';

class CustomProductsGridView extends StatefulWidget {
  const CustomProductsGridView({super.key, required this.products});

  final List<ProductModel> products;

  @override
  State<CustomProductsGridView> createState() => _CustomProductsGridViewState();
}

class _CustomProductsGridViewState extends State<CustomProductsGridView> {
  late List<ProductModel> product;
@override
void initState() {
  super.initState();
  BlocProvider.of<CategoryCubit>(context).getAllSubCategory();
}
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: widget.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 157 / 176.32,
      ),
      itemBuilder: (context, index) {
        final product = widget.products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsView(
                  product: product,
                ),
              ),
            );
          },
          child: ProductCard(
            product: product,
            isFavorite: true,
            onFavoritePressed: () => toggleFavorite(index),
          ),
        );
      },
    );
  }

  void toggleFavorite(int index) {
    setState(() {
      // products[index]['isFavorite'] = !products[index]['isFavorite'];
    });
  }
}
