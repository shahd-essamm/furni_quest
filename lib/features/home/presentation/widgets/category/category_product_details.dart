import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/core/widgets/custom_button.dart';
import 'package:furni_quest/core/widgets/custom_divider_widget.dart';
import 'package:furni_quest/features/cart/presentation/views/cart_view.dart';
import 'package:furni_quest/features/home/data/models/category_product_model/category_product_model.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_check_box.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_rate_widget.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_review_widget.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_card_without_rating.dart';
// Global cart list
// List<Map<String, dynamic>> cartItems = [];
class CategoryProductDetails extends StatefulWidget {
  final CategoryProductModel product;

  const CategoryProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<CategoryProductDetails> createState() => _CategoryProductDetailsState();
}

class _CategoryProductDetailsState extends State<CategoryProductDetails> {
  late String imageSelected;
  int quantity = 1;
  bool isChecked = false;
  late List<bool> isCheckedList;
  

  @override
  void initState() {
    super.initState();
    imageSelected = widget.product.image!;
    final count = widget.product.frequencyBoughtTogether?.length ?? 0;
    isCheckedList = List.generate(count, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final moreBrand = widget.product.moreFromBrand ?? [];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/Share.svg',
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/favorite-ouline.svg',
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageSelected,
                    width: 150,
                    height: 150,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.product.name!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "4.5", // You might want to get this from the product model
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.product.brand!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffBCBCBC),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: const Color(0xff96A093), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        "assets/ar_icon.svg",
                        width: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.description!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff646B62),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Frequently Bought Together",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 124,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      widget.product.frequencyBoughtTogether?.length ?? 0,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final frequentItem =
                        widget.product.frequencyBoughtTogether?[index];
                    final imageUrl = frequentItem?.image ?? '';
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCheckBox(
                            isChecked: isCheckedList[index],
                            onChecked: (value) {
                              setState(() {
                                isCheckedList[index] = value;
                              });
                            },
                          ),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.grey.shade200),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: imageUrl.isEmpty
                                      ? Container(
                                          color: Colors.grey.shade200,
                                          child: const Icon(
                                            Icons.image_not_supported,
                                            size: 40,
                                            color: Colors.grey,
                                          ),
                                        )
                                      : Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            print(
                                                'Image load error at index $index: $error');
                                            print('Image URL: $imageUrl');
                                            return Container(
                                              color: Colors.grey.shade200,
                                              child: const Icon(
                                                Icons.image_not_supported,
                                                size: 40,
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ),
                              if (index !=
                                  (widget.product.frequencyBoughtTogether
                                              ?.length ??
                                          0) -
                                      1) ...[
                                const SizedBox(width: 8),
                                const Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ]
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              CustomButton(
                title: "Buy 2 Items Together",
                backgroundColor: Colors.white,
                textColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
                onTap: () {},
              ),
              const SizedBox(height: 16),
              Text(
                "Product Ratings & Reviews",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CustomRatingWidget(
                          rate: 1,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Based on 22 rating",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomReviewsWidget(
                          index: "1",
                          pressentage: 0.7,
                        ),
                        CustomReviewsWidget(
                          index: "2",
                          pressentage: 0.2,
                        ),
                        CustomReviewsWidget(
                          index: "3",
                          pressentage: 0.9,
                        ),
                        CustomReviewsWidget(
                          index: "4",
                          pressentage: 0.5,
                        ),
                        CustomReviewsWidget(
                          index: "5",
                          pressentage: 0.1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomDividerWidget(),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shahd", // You might want to get this from reviews
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    CustomRatingWidget(rate: (index + 1) * 2),
                    const SizedBox(height: 4),
                    Text(
                      "good", // You might want to get this from reviews
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff646B62),
                      ),
                    ),
                    CustomDividerWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "View More",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "More from Brand",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.74,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  moreBrand.length,
                  (index) => ProductCardWithoutRating(
                    isFavorite: false,
                    onFavoritePressed: () {},
                    imagePath: moreBrand[index].image ?? '',
                    name: moreBrand[index].name??'', // Or use a placeholder like 'Product'
                    price: "\$${moreBrand[index].price??0.toStringAsFixed(0)}",
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    "\$${widget.product.price!.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Add to cart logic here
                        cartItems.add({
                          'title': widget.product.name,
                          'image': imageSelected,
                          'price': widget.product.price,
                          'quantity': 1,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart')),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: const Center(
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
