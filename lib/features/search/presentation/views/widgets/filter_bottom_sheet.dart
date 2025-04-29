import 'package:flutter/material.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/core/widgets/custom_button.dart';
import 'package:furni_quest/core/widgets/custom_divider_widget.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_check_box.dart';
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
              children: [
                Expanded(
                  child: _buildExpandableSection(
                    title: "For",
                    isExpanded: showForOptions,
                    onToggle: () =>
                        setState(() => showForOptions = !showForOptions),
                    child: _buildChips(
                        ['all', 'Garden', 'Kitchen'], selectedFor, (val) {
                      setState(() => selectedFor = val);
                    }),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: _buildExpandableSection(
                    title: "Product",
                    isExpanded: showProductOptions,
                    onToggle: () => setState(
                        () => showProductOptions = !showProductOptions),
                    child: _buildChips(
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
            _buildExpandableSection(
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
                    child: _buildPriceItem(
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
            _buildExpandableSection(
              title: "Style",
              isExpanded: showStyleOptions,
              onToggle: () =>
                  setState(() => showStyleOptions = !showStyleOptions),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildChips(['modern', 'classic', 'rustic'], selectedStyle,
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
            _buildSectionTitle('Colors'),
            SizedBox(
              height: 26,
              child: CustomListViewSelectColorWidget(
                hexColors: [],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            _buildSectionTitle('Rates'),
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

  Widget _buildPriceItem({
    required String priceRange,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            CustomCheckBox(
              isChecked: isSelected,
              onChecked: (_) => onTap(),
            ),
            SizedBox(width: 8),
            Text(
              priceRange,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onToggle,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              Icon(isExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
            ],
          ),
        ),
        if (isExpanded) ...[
          SizedBox(height: 8),
          child,
          SizedBox(height: 12),
        ],
        CustomDividerWidget(),
      ],
    );
  }

  Widget _buildChips(
      List<String> options, String selected, Function(String) onChanged) {
    return Wrap(
      spacing: 8,
      children: options.map((option) {
        final isSelected = option == selected;
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) => onChanged(option),
          selectedColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? AppColors.primaryColor : Colors.grey[400]!,
          ),
          side: BorderSide(
            color: isSelected ? AppColors.primaryColor : Colors.grey[400]!,
            width: 1.0,
          ),
          showCheckmark: false,
        );
      }).toList(),
    );
  }
}
