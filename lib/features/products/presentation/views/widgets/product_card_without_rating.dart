import 'package:flutter/material.dart';

class ProductCardWithoutRating extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final int rating;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const ProductCardWithoutRating({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
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
                    imagePath,
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
                  name,
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
                    Text(
                      "Size: 3ft / 2ft",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6E726C),
                      ),
                    ),
                    // السعر على اليمين
                    Text(
                      price,
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
