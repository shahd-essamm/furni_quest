import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furni_quest/core/utils/app_colors.dart';
import 'package:furni_quest/core/widgets/custom_button.dart';
import 'package:furni_quest/core/widgets/custom_divider_widget.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_check_box.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_list_view_selected_color.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_rate_widget.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/custom_review_widget.dart';
import 'package:furni_quest/features/products/presentation/views/widgets/product_card_without_rating.dart';

// Global cart list
List<Map<String, dynamic>> cartItems = [];

class ProductDetailsView extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsView({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                    "https://aymantaher.com/Furniture/image/coffe 3.jpg"),
              ),
              SizedBox(height: 16),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 218,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          "https://aymantaher.com/Furniture/image/coffe 3.jpg",
                          width: 60,
                          height: 55,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Luxurious Armchair",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "4.5",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Floyed Brand",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(
                            0xffBCBCBC,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xff96A093), width: 1),
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
              SizedBox(
                height: 16,
              ),
              Text(
                "Stylish velvet armchair with a sleek metal frame. Perfect for adding a touch of luxury to your living space.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff646B62),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 26,
                      child: CustomListViewSelectColorWidget(
                        colors: [
                          AppColors.primaryColor,
                          AppColors.primaryColor,
                          AppColors.primaryColor,
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "2",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Frequently Bought Together",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomCheckBox(
                          isChecked: false,
                          onChecked: (value) {},
                        ),
                        Image.asset(
                          "https://aymantaher.com/Furniture/image/coffe 3.jpg",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "+",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomCheckBox(
                          isChecked: true,
                          onChecked: (value) {},
                        ),
                        Image.asset(
                          "https://aymantaher.com/Furniture/image/coffe 3.jpg",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              CustomButton(
                title: "Buy 2 Items Together",
                backgroundColor: Colors.white,
                textColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
                onTap: () {},
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Product Ratings & Reviews",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CustomRatingWidget(
                          rate: 1,
                        ),
                        SizedBox(
                          height: 8,
                        ),
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
                      "Shahd",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    CustomRatingWidget(rate: (index + 1) * 2),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "good",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff646B62),
                      ),
                    ),
                    CustomDividerWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
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
              SizedBox(
                height: 16,
              ),
              Text(
                "Product Comparison",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
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
                    name: widget.product.name,
                    price: "200",
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "More from Brand",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
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
                    name: widget.product.name,
                    price: "200",
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "\$200",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        cartItems.add({
                          'title': widget.product.name,
                          'image':
                              "https://aymantaher.com/Furniture/image/coffe 3.jpg",
                          'price': widget.product.price,
                          'quantity': 1,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Added to cart')),
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
                          child: Center(
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
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
