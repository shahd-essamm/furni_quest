import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/category_cubit/category_cubit.dart';
import 'package:furni_quest/features/home/presentation/widgets/category/category_item.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCardListView extends StatefulWidget {
  const CategoryCardListView({super.key});


  @override
  State<CategoryCardListView> createState() => _CategoryCardListViewState();
}

class _CategoryCardListViewState extends State<CategoryCardListView> {
  @override
  void initState() {
    super.initState();
    // Trigger data loading when widget initializes
    context.read<CategoryCubit>().getAllSubCategory();
  }
  @override
    Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is SubCategoriesLoaded) {
          final categories = state.subCategories;
          
          // Debug print to verify data
          debugPrint('Loaded ${categories.length} categories');
          
          return SizedBox(
            height: 100, // Fixed height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  child: CategoryItem(
                    subCategory: category,
                  ),
                );
              },
            ),
          );
        } 
        else if (state is CategoryLoading) {
          return _buildLoadingShimmer();
        }
        else if (state is CategoryError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return _buildLoadingShimmer(); // Initial state
      },
    );
  }

  Widget _buildLoadingShimmer() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Container(
            width: 80,
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
}