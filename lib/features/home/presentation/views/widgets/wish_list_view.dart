import 'package:flutter/material.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});
  static const routeName = 'WishListView';

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  final List<String> categories = ["All", "Sofa", "Bed", "Chair", "Table"];
  String selectedCategory = "All";

  final List<Map<String, dynamic>> wishlistItems = [
    {
      "name": "Light Grey Chair",
      "size": "1ft / 2ft",
      "price": "\$120",
      "image": "assets/MyWishList_image/LightGreyChair.png",
      "isFavorite": false
    },
    {
      "name": "Grey Light",
      "size": "3ft / 2ft",
      "price": "\$45",
      "image": "assets/MyWishList_image/GreyLight.png",
      "isFavorite": false
    },
    {
      "name": "Vanilla Bed",
      "size": "3ft / 2ft",
      "price": "\$250",
      "image": "assets/MyWishList_image/VanillaBed.png",
      "isFavorite": false
    },
    {
      "name": "White Dressing",
      "size": "3ft / 2ft",
      "price": "\$170",
      "image": "assets/MyWishList_image/WhiteDressing.png",
      "isFavorite": false
    },
    {
      "name": "Grey Chair",
      "size": "4ft / 2ft",
      "price": "\$80",
      "image": "assets/MyWishList_image/GreyChair.png",
      "isFavorite": false
    },
    {
      "name": "Grey Dressing",
      "size": "3ft / 2ft",
      "price": "\$320",
      "image": "assets/MyWishList_image/GreyDressing.png",
      "isFavorite": false
    },
    {
      "name": "White Corner",
      "size": "3ft / 2ft",
      "price": "\$140",
      "image": "assets/MyWishList_image/WhiteCorner.png",
      "isFavorite": false
    },
    {
      "name": "Wood Comode",
      "size": "3ft / 2ft",
      "price": "\$35",
      "image": "assets/MyWishList_image/WoodComode.png",
      "isFavorite": false
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      wishlistItems[index]['isFavorite'] = !wishlistItems[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "My Wishlist",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Heebo',
            color: Color(0xFF3A3E39),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: selectedCategory == category
                              ? const Color(0xFF53634F)
                              : const Color(0xFFC3C9C0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Heebo',
                        color: Color(0xFF53634F),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              itemCount: wishlistItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 157 / 157.32,
              ),
              itemBuilder: (context, index) {
                final item = wishlistItems[index];
                return WishlistCard(
                  name: item['name'],
                  size: item['size'],
                  price: item['price'],
                  imagePath: item['image'],
                  isFavorite: item['isFavorite'],
                  onFavoritePressed: () => toggleFavorite(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WishlistCard extends StatelessWidget {
  final String name;
  final String size;
  final String price;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const WishlistCard({
    super.key,
    required this.name,
    required this.size,
    required this.price,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: 157,
      // height: 157.32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: onFavoritePressed,
            ),
          ),

          Center(
            child: SizedBox(
              height: 70,
              child: Image.asset(
                imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// ✅ نصوص الاسم، الحجم، والسعر
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// اسم المنتج
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Heebo',
                    color: Color(0xFF515E4D),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 2),

                /// ✅ الحجم والسعر داخل Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// الحجم
                    Text(
                      "Size: $size",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Heebo',
                        color: Color(0xFF515E4D),
                      ),
                    ),

                    /// السعر
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Heebo',
                        color: Color(0xFF232922),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
}






// import 'package:flutter/material.dart';
//
// class WishlistScreen extends StatefulWidget {
//   @override
//   _WishlistScreenState createState() => _WishlistScreenState();
// }
//
// class _WishlistScreenState extends State<WishlistScreen> {
//   final List<String> categories = ["All", "Sofa", "Bed", "Chair", "Table"];
//   String selectedCategory = "All";
//
//   final List<Map<String, dynamic>> wishlistItems = [
//     {"name": "Light Grey Chair", "size": "1ft / 2ft", "price": "\$120", "image": "assets/MyWishList_image/LightGreyChair.png", "isFavorite": false},
//     {"name": "Grey Light", "size": "3ft / 2ft", "price": "\$45", "image": "assets/MyWishList_image/GreyLight.png", "isFavorite": false},
//     {"name": "Vanilla Bed", "size": "3ft / 2ft", "price": "\$250", "image": "assets/MyWishList_image/VanillaBed.png", "isFavorite": false},
//     {"name": "White Dressing", "size": "3ft / 2ft", "price": "\$170", "image": "assets/MyWishList_image/WhiteDressing.png", "isFavorite": false},
//     {"name": "Grey Chair", "size": "4ft / 2ft", "price": "\$80", "image": "assets/MyWishList_image/GreyChair.png", "isFavorite": false},
//     {"name": "Grey Dressing", "size": "3ft / 2ft", "price": "\$320", "image": "assets/MyWishList_image/GreyDressing.png", "isFavorite": false},
//     {"name": "White Corner", "size": "3ft / 2ft", "price": "\$140", "image": "assets/MyWishList_image/WhiteCorner.png", "isFavorite": false},
//     {"name": "Wood Comode", "size": "3ft / 2ft", "price": "\$35", "image": "assets/MyWishList_image/WoodComode.png", "isFavorite": false},
//   ];
//
//   void toggleFavorite(int index) {
//     setState(() {
//       wishlistItems[index]['isFavorite'] = !wishlistItems[index]['isFavorite'];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           "My Wishlist",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             fontFamily: 'Heebo',
//             color: Color(0xFF3A3E39),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: categories.map((category) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedCategory = category;
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: selectedCategory == category ? Color(0xFF53634F) : Color(0xFFC3C9C0),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       category,
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               padding: EdgeInsets.all(20),
//               itemCount: wishlistItems.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 childAspectRatio: 157 / 176.32,
//               ),
//               itemBuilder: (context, index) {
//                 final item = wishlistItems[index];
//                 return WishlistCard(
//                   name: item['name'],
//                   size: item['size'],
//                   price: item['price'],
//                   imagePath: item['image'],
//                   isFavorite: item['isFavorite'],
//                   onFavoritePressed: () => toggleFavorite(index),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class WishlistCard extends StatelessWidget {
//   final String name;
//   final String size;
//   final String price;
//   final String imagePath;
//   final bool isFavorite;
//   final VoidCallback onFavoritePressed;
//
//   const WishlistCard({
//     required this.name,
//     required this.size,
//     required this.price,
//     required this.imagePath,
//     required this.isFavorite,
//     required this.onFavoritePressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 157,
//       height: 176.32,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 8,
//             right: 8,
//             child: GestureDetector(
//               onTap: onFavoritePressed,
//               child: Icon(
//                 isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: isFavorite ? Colors.red : Colors.grey,
//               ),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: SizedBox(
//                   height: 160,
//                   child: Image.asset(
//                     imagePath,
//                     width: 100,
//                     height: 100,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 8),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10.0),
//                 child: Text(
//                   name,
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: 'Heebo',
//                     color: Color(0xFF515E4D),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 4),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Text(
//                   "Size: $size",
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'Heebo',
//                     color: Color(0xFF515E4D),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 4),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     price,
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'Heebo',
//                       color: Color(0xFF232922),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }