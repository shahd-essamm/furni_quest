import 'package:flutter/material.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_card.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_deatils_view.dart';

class CustomProductsGridView extends StatefulWidget {
  const CustomProductsGridView({super.key});

  @override
  State<CustomProductsGridView> createState() => _CustomProductsGridViewState();
}

class _CustomProductsGridViewState extends State<CustomProductsGridView> {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Light Grey Chair",
      "price": "\$200",
      "image": "assets/chair_image/LightgreyChair.png",
      "rating": 4,
      "isFavorite": false
    },
    {
      "name": "Brown Chair",
      "price": "\$200",
      "image": "assets/chair_image/BrownChair.png",
      "rating": 3,
      "isFavorite": false
    },
    {
      "name": "Grey Chair",
      "price": "\$200",
      "image": "assets/chair_image/GreyChair.png",
      "rating": 5,
      "isFavorite": false
    },
    {
      "name": "Green Chair",
      "price": "\$200",
      "image": "assets/chair_image/GreenChair.png",
      "rating": 4,
      "isFavorite": false
    },
    {
      "name": "Dark Grey Chair",
      "price": "\$200",
      "image": "assets/chair_image/DarkGreyChair.png",
      "rating": 3,
      "isFavorite": false
    },
    {
      "name": "Outdoor Chair",
      "price": "\$200",
      "image": "assets/chair_image/OutdoorChair.png",
      "rating": 4,
      "isFavorite": false
    },
    {
      "name": "Vanilla Chair",
      "price": "\$200",
      "image": "assets/chair_image/VanillaChair.png",
      "rating": 5,
      "isFavorite": false
    },
    {
      "name": "Light Chair",
      "price": "\$200",
      "image": "assets/chair_image/LightChair.png",
      "rating": 4,
      "isFavorite": false
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 157 / 176.32,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsView(
                  title: product['name'],
                  image: product['image'],
                  price: 200,
                  rating: product['rating'],
                ),
              ),
            );
          },
          child: ProductCard(
            name: product['name'],
            price: product['price'],
            imagePath: product['image'],
            rating: product['rating'],
            isFavorite: product['isFavorite'],
            onFavoritePressed: () => toggleFavorite(index),
          ),
        );
      },
    );
  }

  void toggleFavorite(int index) {
    setState(() {
      products[index]['isFavorite'] = !products[index]['isFavorite'];
    });
  }
}
