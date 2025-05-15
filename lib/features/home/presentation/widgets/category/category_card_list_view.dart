import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/core/services/injection.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/category_cubit/category_cubit.dart';
import 'package:furni_quest/features/home/data/models/sub_category_model/sub_category_model.dart';
import 'package:furni_quest/features/home/data/repos/category_repo.dart';
import 'package:furni_quest/features/home/presentation/widgets/category/category_item.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCardListView extends StatelessWidget {
  const CategoryCardListView({super.key});
  @override
    Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CategoryCubit(getIt.get<CategoryRepo>(),)
        ..getAllSubCategory(),
        child: BlocConsumer<CategoryCubit,CategoryState>(
          listener: (context, state) {
          if (state is CategoryError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          }, builder: (context,state) { 
            if (state is CategoryLoading) {
              return _buildLoadingShimmer();
            } else if (state is SubCategoriesLoaded) {
              return _buildCategoryList(state.subCategories);
            } else if (state is CategoryError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
           },
        ),
    );
  }

  Widget _buildCategoryList(List<SubCategory> subCategories) {
    return SizedBox(
            height: 95, // Fixed height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subCategories.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final category = subCategories[index];
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