import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});
  static const routeName = 'WishListView';

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WishlistCubit>().state;

    if (state is WishlistInitial) {
      final List<ProductModel> wishlistItems = state.wishlist;

      return Scaffold(
        appBar: AppBar(
          title: const Text("My Wishlist",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          leading: const BackButton(),
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Category Filter Bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryFilterChip(label: "All"),
                    SizedBox(width: 8),
                    CategoryFilterChip(label: "Sofa"),
                    SizedBox(width: 8),
                    CategoryFilterChip(label: "Bed"),
                    SizedBox(width: 8),
                    CategoryFilterChip(label: "Chair"),
                    SizedBox(width: 8),
                    CategoryFilterChip(label: "Table"),
                  ],
                ),
              ),
            ),
            // Product Grid
            Expanded(
              child: wishlistItems.isEmpty
                  ? const Center(child: Text("No items in wishlist"))
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: wishlistItems.length,
                      itemBuilder: (context, index) {
                        final product = wishlistItems[index];
                        return _buildProductCard(context, product);
                      },
                    ),
            ),
          ],
        ),
      );
    }
    // Return a fallback widget for other states
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildProductCard(BuildContext context, ProductModel product) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  product.images[0].imageUrl,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 120,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_not_supported, size: 40),
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  color: Colors.red,
                  onPressed: () {
                    context.read<WishlistCubit>().toggleWishlist(product);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff515E4D),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Size: 3ft/2ft', // Placeholder size, adjust as needed
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                  '\$${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget for category filter chips
class CategoryFilterChip extends StatelessWidget {
  final String label;

  const CategoryFilterChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add filter logic here if needed
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 250, 250),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      child: Text(label),
    );
  }
}