import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/core/services/get_it_service.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';
import 'package:furni_quest/features/home/presentation/cubits/category_cubit.dart';
import 'package:furni_quest/features/home/presentation/cubits/category_state.dart';
import 'package:furni_quest/features/home/presentation/views/category_card.dart';
import 'package:furni_quest/features/products/presentation/views/products_of_category_view.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCardListView extends StatelessWidget {
  const CategoryCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopByCategoryCubit(
        getIt.get<CategoryRepo>(),
      )..getAllCategory(),
      child: BlocConsumer<ShopByCategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is ShopByCategoryFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is ShopByCategoryLoading) {
            return SizedBox(
              height: 95,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (state is ShopByCategorySuccess) {
            return SizedBox(
              height: 95,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CategoryCardItem(
                    category: state.categories.categories[index],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsOfCategoryView(
                          products: [],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
