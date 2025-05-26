import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/core/services/injection.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/category_cubit/category_cubit.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:furni_quest/features/home/data/models/category_product_model/category_product_model.dart';
import 'package:furni_quest/features/home/data/models/sub_category_model/sub_category_model.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';
import 'package:furni_quest/features/home/presentation/widgets/category/category_product_details.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCardDetails extends StatefulWidget {
  final int categoryId;
  final SubCategory subCategory;

  const CategoryCardDetails(
      {super.key, required this.categoryId, required this.subCategory});

  @override
  State<CategoryCardDetails> createState() => _CategoryCardDetailsState();
}

class _CategoryCardDetailsState extends State<CategoryCardDetails> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(getIt.get<CategoryRepo>())
        ..getSubCategoryProductsById(widget.categoryId),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return _buildLoadingState();
          } else if (state is SubCategoryProductsLoaded) {
            return _buildProductGrid(state.products);
          } else if (state is CategoryError) {
            return _buildErrorState(context, state.message);
          } else {
            return _buildInitialState();
          }
        },
      ),
    );
  }

  Widget _buildProductGrid(List<CategoryProductModel> products) {
    if (products.isEmpty) {
      return const Center(child: Text('No products available'));
    }

    return Scaffold(
      appBar: AppBar(
        title:Text(
          'Categories',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        padding: const EdgeInsets.all(14),
        itemBuilder: (context, index) {
          final product = products[index];
          return _buildProductCard(context, product);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, CategoryProductModel product) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryProductDetails(
            product: product,
          ),
        ),
      ),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: AspectRatio(
                    aspectRatio: 1.1,
                    child: product.image!.isNotEmpty
                        ? Image.network(
                            product.image ?? '',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildImagePlaceholder(),
                            loadingBuilder: (context, child, loadingProgress) =>
                                loadingProgress == null
                                    ? child
                                    : Center(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.grey.shade100,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                          )
                        : _buildImagePlaceholder(),
                  ),
                ),
                Positioned(
                  right: 1,
                  top: 3,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff515E4D)
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < 4 ? Icons.star : Icons.star_border,
                            size: 16,
                            color: Color(0xffFBBC04),
                          );
                        }),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Text(
                      '\$${product.price!.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
              ),
              onPressed: () => context
                  .read<CategoryCubit>()
                  .getSubCategoryProductsById(widget.categoryId),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return const Scaffold(
      body: Center(
        child: Text(
          'No data available',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

Widget _buildLoadingState() {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Category Details'),
      centerTitle: true,
    ),
    body: GridView.builder(
      itemCount: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    ),
  );
}
