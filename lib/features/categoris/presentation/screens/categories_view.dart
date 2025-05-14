import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/core/services/injection.dart';
import 'package:furni_quest/features/categoris/business_logic/cubit/category_page_cubit.dart';
import 'package:furni_quest/features/categoris/data/models/category_model.dart';

class CategoriesView extends StatefulWidget {
  static const String routeName = 'categories_view';
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  Map<int, bool> expandedState = {};
  Map<int, List<SubCategoryModel>> subCategoriesMap = {};

  void toggleExpansion(int categoryId, BuildContext context) {
    setState(() {
      expandedState[categoryId] = !(expandedState[categoryId] ?? false);
    });

    final isNowExpanded = expandedState[categoryId]!;

    if (isNowExpanded && !subCategoriesMap.containsKey(categoryId)) {
      context
          .read<CategoryPageCubit>()
          .getSubCategoryByCategoryId(categoryId)
          .then((subList) {
        setState(() {
          subCategoriesMap[categoryId] = subList;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryPageCubit>()
        ..getAllCategoriesOnly()
        ..getSubCategory(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3A3E39),
                  ),
                ),
                const SizedBox(height: 22),
                Expanded(
                  child: BlocBuilder<CategoryPageCubit, CategoryPageState>(
                    builder: (context, state) {
                      if (state is CategoryLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CategoryLoaded) {
                        final categories = state.categoryList;

                        return ListView(
                          children: categories.map((category) {
                            final id = category.id ?? -1;
                            final isExpanded = expandedState[id] ?? false;
                            final subCategories = subCategoriesMap[id] ?? [];

                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () => toggleExpansion(id, context),
                                  child: Container(
                                    width: double.infinity,
                                    height: 156,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(category.image ?? ''),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              category.name ?? '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF3A3E39),
                                              ),
                                            ),
                                            Icon(
                                              isExpanded
                                                  ? Icons.keyboard_arrow_up
                                                  : Icons.keyboard_arrow_down,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (isExpanded)
                                  ...subCategories.map((sub) {
                                    return Container(
                                      width: double.infinity,
                                      height: 44,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: const Offset(0, 2),
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              sub.name ?? '',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF232922),
                                              ),
                                            ),
                                            Image.network(
                                              sub.image ?? '',
                                              width: 109,
                                              height: 44,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  const Icon(
                                                      Icons.broken_image),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                const SizedBox(height: 20),
                              ],
                            );
                          }).toList(),
                        );
                      } else {
                        return const Center(
                          child: Text('Failed to load categories'),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
