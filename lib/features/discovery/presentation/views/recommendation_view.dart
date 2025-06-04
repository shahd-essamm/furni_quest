// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_quest/core/helper_functions/build_chips.dart';
import 'package:furni_quest/core/helper_functions/build_color_platte.dart';
import 'package:furni_quest/core/helper_functions/build_expandble_section.dart';
import 'package:furni_quest/core/helper_functions/build_section_title.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/core/widgets/custom_button.dart';
import 'package:furni_quest/features/home/bussniss_logic/cubits/category_cubit/category_cubit.dart';
import 'package:furni_quest/features/home/data/models/category_product_model/category_product_model.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_card_without_rating.dart';
import 'package:image_picker/image_picker.dart';

class RecommendationView extends StatefulWidget {
  const RecommendationView({super.key});
  static const String routeName = 'recommendation_view';

  @override
  State<RecommendationView> createState() => _RecommendationViewState();
}

class _RecommendationViewState extends State<RecommendationView> {
  String selectedFor = 'all';
  String selectedProduct = 'all';
  String selectedStyle = 'all';
  String? selectedPalette;

  bool showForOptions = false;
  bool showProductOptions = false;
  bool showStyleOptions = false;
  bool showColorOptions = false;
  bool isPalattePicker = false;

  TextEditingController minBudgetController = TextEditingController();
  TextEditingController maxBudgetController = TextEditingController();

  final Map<String, int> categoryIdMap = {
    'all': -1,
    'Bedroom': 2,
    'Dining Room': 5,
    'living Room': 6,
    'Outdoor Furniture': 7,
  };

  final List<String> categories = [
    'all',
    'Bedroom',
    'Dining Room',
    'living Room',
    'Outdoor Furniture'
  ];

  final List<String> subcategories = [
    'all',
    'Beds',
    'Room Sets',
    'Commodes',
    'Dressing',
    'Chairs',
    'Coffee Corners',
    'Dining Tables',
    'Lighting',
    'TV Units',
    'Outdoor Chair',
    'Wooden Side Tables',
    'Steel Outdoor'
  ];

  final List<String> styles = [
    'all',
    'Modern',
    'Bohemian',
    'Industrial',
    'Minimalist',
    'Traditional',
    'Scandinavian'
  ];

  final Map<String, List<String>> colorOptions = {
    'colorPlatte1': [
      '#E4E1D7',
      '#CCAC85',
      '#E3D3BC',
      '#705D3F',
      '#B4B897',
      '#849573'
    ],
    'colorPlatte2': [
      '#C6B9B3',
      '#A29896',
      '#847675',
      '#534248',
      '#48373D',
      '#362A2C'
    ],
    'colorPlatte3': [
      '#BAB8A9',
      '#8C8B77',
      '#6A5A43',
      '#647E71',
      '#3C564B',
      '#28332B'
    ],
    'colorPlatte4': [
      '#FDFBFB',
      '#BDBEB9',
      '#9D9C9A',
      '#706C69',
      '#A69382',
      '#8391A1'
    ],
  };

  List<CategoryProductModel> allProducts = [];
  List<CategoryProductModel> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getSubCategoryProducts();
  }

  void resetFilters() {
    setState(() {
      selectedFor = 'all';
      selectedProduct = 'all';
      selectedStyle = 'all';
      selectedPalette = null;
      minBudgetController.clear();
      maxBudgetController.clear();
      filteredProducts = List.from(allProducts);
    });
  }

  bool _isPaletteMatch(
      List<dynamic> productPalette, List<String> selectedPalette) {
    try {
      if (selectedPalette.isEmpty) return true;
      List<String> productColors = productPalette.cast<String>();
      return productColors.any((color) => selectedPalette.contains(color));
    } catch (e) {
      print('Color palette matching error: $e');
      return false;
    }
  }

  void applyFilters() {
    setState(() {
      filteredProducts = allProducts.where((product) {
        bool categoryMatch = selectedFor == 'all' ||
            product.categoryId == categoryIdMap[selectedFor];

        bool productMatch = selectedProduct == 'all' ||
            product.subcategoryId == subcategories.indexOf(selectedProduct);

        bool styleMatch = selectedStyle == 'all' ||
            (product.style?.toLowerCase() == selectedStyle.toLowerCase());

        bool paletteMatch = selectedPalette == null ||
            (product.colorPalette != null &&
                _isPaletteMatch(jsonDecode(product.colorPalette!),
                    colorOptions[selectedPalette] ?? []));

        double minBudget = double.tryParse(minBudgetController.text) ?? 0;
        double maxBudget =
            double.tryParse(maxBudgetController.text) ?? double.infinity;
        bool budgetMatch = (product.price ?? 0) >= minBudget &&
            (product.price ?? 0) <= maxBudget;

        return categoryMatch &&
            productMatch &&
            styleMatch &&
            paletteMatch &&
            budgetMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "The Most Appropriate For You",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategoryError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is CategoryLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is SubCategoryProductsLoaded) {
            allProducts = state.products;
            if (filteredProducts.isEmpty) {
              filteredProducts = List.from(allProducts);
            }
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: buildExpandableSection(
                          title: "For",
                          isExpanded: showForOptions,
                          onToggle: () =>
                              setState(() => showForOptions = !showForOptions),
                          child: buildChips(categories, selectedFor, (val) {
                            setState(() {
                              selectedFor = val;
                              applyFilters();
                            });
                          }),
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: buildExpandableSection(
                          title: "Product",
                          isExpanded: showProductOptions,
                          onToggle: () => setState(
                              () => showProductOptions = !showProductOptions),
                          child:
                              buildChips(subcategories, selectedProduct, (val) {
                            setState(() {
                              selectedProduct = val;
                              applyFilters();
                            });
                          }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  buildExpandableSection(
                    title: "Style",
                    isExpanded: showStyleOptions,
                    onToggle: () =>
                        setState(() => showStyleOptions = !showStyleOptions),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildChips(styles, selectedStyle, (val) {
                          setState(() {
                            selectedStyle = val;
                            applyFilters();
                          });
                        }),
                        SizedBox(height: 6),
                        CustomButton(
                          title: "Suggest Style",
                          backgroundColor: Colors.white,
                          textColor: AppColors.primaryColor,
                          borderColor: AppColors.primaryColor,
                          onTap: () async {
                            final picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.camera);
                            if (image != null) {
                              // Randomly select a style
                              final List<String> availableStyles =
                                  styles.where((s) => s != 'all').toList();
                              final randomStyle =
                                  (availableStyles..shuffle()).first;

                              setState(() {
                                selectedStyle = randomStyle;
                                applyFilters();
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        "Style selected: $randomStyle")),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  buildExpandableSection(
                    title: "Color Palette",
                    isExpanded: showColorOptions,
                    onToggle: () =>
                        setState(() => showColorOptions = !showColorOptions),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: List.generate(4, (index) {
                            return ColorPaletteRow(
                              colorOptions: index == 3 && isPalattePicker
                                  ? []
                                  : colorOptions['colorPlatte${index + 1}']!,
                              isSelected:
                                  selectedPalette == 'colorPlatte${index + 1}',
                              onChanged: (value) {
                                setState(() {
                                  selectedPalette =
                                      value! ? 'colorPlatte${index + 1}' : null;
                                  applyFilters();
                                });
                              },
                            );
                          }),
                        ),
                        SizedBox(height: 16),
                        CustomButton(
                          title: "Palette Picker",
                          backgroundColor: Colors.white,
                          textColor: AppColors.primaryColor,
                          borderColor: AppColors.primaryColor,
                          onTap: () async {
                            final picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.camera);
                            if (image != null) {
                              // Simulate palette extraction by randomly selecting one
                              final randomPalette =
                                  (colorOptions.keys.toList()..shuffle()).first;

                              setState(() {
                                selectedPalette = randomPalette;
                                applyFilters();
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        "Color palette selected: $randomPalette")),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  buildSectionTitle("Your Budget"),
                  buildYourBudget(),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: "Reset",
                          backgroundColor: Colors.white,
                          textColor: AppColors.primaryColor,
                          borderColor: AppColors.primaryColor,
                          onTap: resetFilters,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          title: "Apply",
                          onTap: applyFilters,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  buildSectionTitle(
                      "Results Found (${filteredProducts.length})"),
                  SizedBox(height: 16),
                  filteredProducts.isEmpty
                      ? Center(
                          child: Text(
                            "No products found matching your criteria",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.8,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: filteredProducts.map((product) {
                            return ProductCardWithoutRating(
                              isFavorite: false,
                              onFavoritePressed: () {},
                              imagePath: product.image ?? '',
                              name: product.name ?? '',
                              price: "\$${product.price ?? 0}",
                            );
                          }).toList(),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row buildYourBudget() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Min Budget",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  TextField(
                    controller: minBudgetController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "\$0",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffC3C9C0)),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => applyFilters(),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Max Budget",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  TextField(
                    controller: maxBudgetController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "\$0",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffC3C9C0)),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => applyFilters(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
