import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 176.32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          // أيقونة القلب في أعلى اليمين
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: onFavoritePressed,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),

          // محتوى الكارد
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // يجعل العناصر تبدأ من اليسار
            children: [
              Center(
                child: SizedBox(
                  height: 150,
                  child: Image.asset(
                    "https://aymantaher.com/Furniture/image/coffe 3.jpg",
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Heebo',
                    color: Color(0xFF515E4D),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // النجوم محاذاة لليسار
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          size: 14,
                          color: Colors.amber,
                        );
                      }),
                    ),
                    // السعر على اليمين
                    Text(
                      product.price,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Heebo',
                        color: Color(0xFF232922),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
