import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furni_quest/core/helper_functions/build_chips.dart';
import 'package:furni_quest/core/helper_functions/build_color_platte.dart';
import 'package:furni_quest/core/helper_functions/build_expandble_section.dart';
import 'package:furni_quest/core/helper_functions/build_section_title.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/core/widgets/custom_button.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_card_without_rating.dart';
import 'package:image_picker/image_picker.dart';

class RecommendationView extends StatefulWidget {
  const RecommendationView({super.key});

  @override
  State<RecommendationView> createState() => _RecommendationViewState();
}

class _RecommendationViewState extends State<RecommendationView> {
  String selectedFor = 'all';
  String selectedProduct = 'all';
  String selectedStyle = 'modern';

  bool showForOptions = false;
  bool showProductOptions = false;
  bool showStyleOptions = false;
  bool showColorOptions = false;
  bool isPalattePicker = false;

  TextEditingController minBudgetController = TextEditingController();
  TextEditingController maxBudgetController = TextEditingController();

  final Map<String, List<String>> colorOptions = {
    'colorPlatte1': [
      '#E4E1D7',
      '#CCAC85',
      '#E3D3BC',
      '#705D3F',
      '#B4B897',
      '#849573',
    ],
    'colorPlatte2': [
      '#C6B9B3',
      '#A29896',
      '#847675',
      '#534248',
      '#48373D',
      '#362A2C',
    ],
    'colorPlatte3': [
      '#BAB8A9',
      '#8C8B77',
      '#6A5A43',
      '#647E71',
      '#3C564B',
      '#28332B',
    ],
    'colorPlatte4': [
      '#FDFBFB',
      '#BDBEB9',
      '#9D9C9A',
      '#706C69',
      '#A69382',
      '#8391A1',
    ]
  };

  void resetFilters() {
    setState(() {
      selectedFor = 'all';
      selectedProduct = 'all';
      selectedStyle = 'modern';
    });
  }

  final List<String> priceRanges = [
    "\$50 - \$300",
    "\$300 - \$500",
    "\$500 - \$900",
    "\$900 - \$1300",
    "\$1300 - \$1900",
    "\$1900 - \$2500",
  ];

  RangeValues selectedRange = RangeValues(0, 5);
  List<bool> selectedPalettes = List.filled(4, false);
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
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
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
                      child: buildChips(
                          ['all', 'Garden', 'Kitchen'], selectedFor, (val) {
                        setState(() => selectedFor = val);
                      }),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: buildExpandableSection(
                      title: "Product",
                      isExpanded: showProductOptions,
                      onToggle: () => setState(
                          () => showProductOptions = !showProductOptions),
                      child: buildChips(
                          ['all', 'chairs', 'seat'], selectedProduct, (val) {
                        setState(() => selectedProduct = val);
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              buildExpandableSection(
                title: "Style",
                isExpanded: showStyleOptions,
                onToggle: () =>
                    setState(() => showStyleOptions = !showStyleOptions),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildChips(['modern', 'classic', 'rustic'], selectedStyle,
                        (val) {
                      setState(() => selectedStyle = val);
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      title: "Suggest Style",
                      backgroundColor: Colors.white,
                      textColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              buildExpandableSection(
                title: "Color Palette",
                isExpanded: showColorOptions,
                onToggle: () =>
                    setState(() => showColorOptions = !showColorOptions),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(
                        4,
                        (index) => ColorPaletteRow(
                          colorOptions: index == 3 && isPalattePicker
                              ? []
                              : colorOptions['colorPlatte${index + 1}']!,
                          isSelected: selectedPalettes[index],
                          onChanged: (value) {
                            setState(() {
                              selectedPalettes[index] = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      title: "Palette Picker",
                      backgroundColor: Colors.white,
                      textColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.camera);

                        if (image != null) {
                          File imageFile = File(image.path);
                          print(imageFile);
                          // رفع الصورة للباك اند
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
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
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              buildSectionTitle("Results Found"),
              SizedBox(
                height: 16,
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 157 / 176.32,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  2,
                  (index) => ProductCardWithoutRating(
                    isFavorite: false,
                    onFavoritePressed: () {},
                    imagePath:
                        "https://aymantaher.com/Furniture/image/coffe 3.jpg",
                    name: "Vanilla Bed",
                    price: "\$200",
                  ),
                ),
              ),
            ],
          ),
        ),
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
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Min Budget",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    controller: minBudgetController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "\$0",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffC3C9C0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Max Budget",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    controller: maxBudgetController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "\$0",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffC3C9C0),
                        )),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {});
                    },
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
