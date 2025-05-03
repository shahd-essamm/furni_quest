import 'package:flutter/material.dart';
import 'package:furni_quest/core/helper_functions/build_chips.dart';
import 'package:furni_quest/core/helper_functions/build_expandble_section.dart';
import 'package:furni_quest/core/helper_functions/build_price_item.dart';
import 'package:furni_quest/core/helper_functions/build_section_title.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/core/widgets/custom_button.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_list_view_selected_color.dart';

class FilterBottomSheet extends StatefulWidget {
  final void Function(Map<String, dynamic>) onApply;

  const FilterBottomSheet({super.key, required this.onApply});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedFor = 'all';
  String selectedProduct = 'all';
  String selectedStyle = 'modern';
  String selectedPrice = '50-300';
  String selectedReview = '1-5';
  Color? selectedColor;

  bool showForOptions = false;
  bool showProductOptions = false;
  bool showStyleOptions = false;
  bool showPriceOptions = false;
  bool showReviewOptions = false;
  bool showColorOptions = false;

  final List<Color> colorOptions = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.black,
    Colors.brown,
    Colors.purple,
  ];

  void resetFilters() {
    print("Reset pressed");
    setState(() {
      selectedFor = 'all';
      selectedProduct = 'all';
      selectedStyle = 'modern';
      selectedPrice = "\$50 - \$300";
      selectedRange = RangeValues(1, 5);
      selectedColor = null;
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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight:
            MediaQuery.of(context).size.height * 0.85, // مثلاً 85% من الشاشة
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16,
          24,
          16,
          MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  height: 4,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                'Filter',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: buildExpandableSection(
                    title: "For",
                    isExpanded: showForOptions,
                    onToggle: () =>
                        setState(() => showForOptions = !showForOptions),
                    child: buildChips(['all', 'Garden', 'Kitchen'], selectedFor,
                        (val) {
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
              title: "Price",
              isExpanded: showPriceOptions,
              onToggle: () =>
                  setState(() => showPriceOptions = !showPriceOptions),
              child: Wrap(
                spacing: 16,
                runSpacing: 8,
                children: priceRanges.map((range) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width - 64) / 2,
                    child: buildPriceItem(
                      priceRange: range,
                      isSelected: selectedPrice == range,
                      onTap: () {
                        setState(() {
                          selectedPrice = range;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
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
            buildSectionTitle('Colors'),
            SizedBox(
              height: 26,
              child: CustomListViewSelectColorWidget(
                hexColors: [
                  ImageModel(imageUrl: "", color: "black", colorHex: "#000000"),
                  ImageModel(imageUrl: "", color: "red", colorHex: "#dd0000"),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            buildSectionTitle('Rates'),
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                RangeSlider(
                  activeColor: AppColors.primaryColor,
                  inactiveColor: Colors.grey,
                  values: selectedRange,
                  min: 0,
                  max: 5,
                  labels: RangeLabels(
                    selectedRange.start.toStringAsFixed(1),
                    selectedRange.end.toStringAsFixed(1),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      selectedRange = values;
                    });
                  },
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(5, (index) {
                      return Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Text(
                            "${index + 1}.0",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      );
                    })),
              ],
            ),
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
                      widget.onApply({
                        'for': selectedFor,
                        'product': selectedProduct,
                        'price': selectedPrice,
                        'style': selectedStyle,
                        'review': selectedReview,
                        'color': selectedColor,
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
