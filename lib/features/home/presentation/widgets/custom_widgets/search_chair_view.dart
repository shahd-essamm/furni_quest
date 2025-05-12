import 'package:flutter/material.dart';

class SearchChairView extends StatefulWidget {
  const SearchChairView({super.key});
  static const String routeName = 'search_chair_view';

  @override
  State<SearchChairView> createState() => _SearchChairViewState();
}

class _SearchChairViewState extends State<SearchChairView> {
  final List<Map<String, dynamic>> chairs = [
    {
      "name": "Light Grey Chair",
      "price": "\$200",
      "image": "assets/chair_image/LightgreyChair.png",
      "rating": 4,
      "isFavorite": false
    },
    {
      "name": "Brown Chair",
      "price": "\$200",
      "image": "assets/chair_image/BrownChair.png",
      "rating": 3,
      "isFavorite": false
    },
    {
      "name": "Grey Chair",
      "price": "\$200",
      "image": "assets/chair_image/GreyChair.png",
      "rating": 5,
      "isFavorite": false
    },
    {
      "name": "Green Chair",
      "price": "\$200",
      "image": "assets/chair_image/GreenChair.png",
      "rating": 4,
      "isFavorite": false
    },
    {
      "name": "Dark Grey Chair",
      "price": "\$200",
      "image": "assets/chair_image/DarkGreyChair.png",
      "rating": 3,
      "isFavorite": false
    },
    {
      "name": "Outdoor Chair",
      "price": "\$200",
      "image": "assets/chair_image/OutdoorChair.png",
      "rating": 4,
      "isFavorite": false
    },
    {
      "name": "Vanilla Chair",
      "price": "\$200",
      "image": "assets/chair_image/VanillaChair.png",
      "rating": 5,
      "isFavorite": false
    },
    {
      "name": "Light Chair",
      "price": "\$200",
      "image": "assets/chair_image/LightChair.png",
      "rating": 4,
      "isFavorite": false
    },
  ];

  final TextEditingController _searchController =
      TextEditingController(text: "Chair");

  void toggleFavorite(int index) {
    setState(() {
      chairs[index]['isFavorite'] = !chairs[index]['isFavorite'];
    });
  }

  void clearSearch() {
    setState(() {
      _searchController.clear();
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
          icon: Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: 264,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFA7B2A3), width: 1),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF101828).withOpacity(0.1),
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              hintText: "Search...",
              hintStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'Heebo',
                color: Color(0xFF6E726C),
              ),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.close, color: Color(0xFF3A3E39)),
                      onPressed: clearSearch,
                    )
                  : null,
            ),
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Heebo',
              color: Color(0xFF3A3E39),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              children: [
                Flexible(
                  child: Text(
                    "Results for ${_searchController.text}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Heebo',
                      color: Color(0xFF3B3A35),
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                SizedBox(width: 150),
                Flexible(
                  child: Text(
                    "100 Results Found",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Heebo',
                      color: Color(0xFF6E726C),
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: chairs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 157 / 176.32,
                ),
                itemBuilder: (context, index) {
                  final chair = chairs[index];
                  return GestureDetector(
                    onTap: () {
                      print("Navigating to details of ${chair['name']}");
                    },
                    child: ChairCard(
                      name: chair['name'],
                      price: chair['price'],
                      imagePath: chair['image'],
                      rating: chair['rating'],
                      isFavorite: chair['isFavorite'],
                      onFavoritePressed: () => toggleFavorite(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChairCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final int rating;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const ChairCard({
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Center(
                child: Image.asset(imagePath,
                    width: 120, height: 120, fit: BoxFit.contain),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(name,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Heebo',
                        color: Color(0xFF515E4D))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                index < rating ? Icons.star : Icons.star_border,
                                size: 14,
                                color: Colors.amber))),
                    Text(price,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Heebo',
                            color: Color(0xFF232922))),
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























// import 'package:flutter/material.dart';
//
// class SearchChairScreen extends StatefulWidget {
//   @override
//   _SearchResultsScreenState createState() => _SearchResultsScreenState();
// }
//
// class _SearchResultsScreenState extends State<SearchChairScreen> {
//   TextEditingController _searchController = TextEditingController(text: "Chair");
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Color(0xFF3A3E39), size: 24),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           "My Wishlist",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF3A3E39),
//             fontFamily: 'Heebo',
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // شريط البحث
//             Container(
//               width: 264,
//               height: 44,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Color(0xFFA7B2A3), width: 1),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0x1A101828), // شفافية 10% لظل أقرب للصورة
//                     offset: Offset(0, 1),
//                     blurRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _searchController,
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF3A3E39),
//                         fontFamily: 'Heebo',
//                       ),
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                         border: InputBorder.none,
//                       ),
//                       onChanged: (text) {
//                         setState(() {}); // تحديث الواجهة عند تغيير النص
//                       },
//                     ),
//                   ),
//                   if (_searchController.text.isNotEmpty)
//                     IconButton(
//                       icon: Icon(Icons.close, color: Color(0xFF3A3E39), size: 20),
//                       onPressed: () {
//                         setState(() {
//                           _searchController.clear();
//                         });
//                       },
//                     ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 12), // المسافة بين شريط البحث والجمل
//
//             // وضع الجملتين في نفس السطر (Row)
//             Row(
//               children: [
//                 Text(
//                   "Results for Chair",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF3B3A35),
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//                 const SizedBox(width: 8), // المسافة بين الجملتين
//                 Text(
//                   "Showing all results related to 'Chair'",
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF6E726C),
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 16), // المسافة بين النصوص و GridView
//
//             // شبكة المنتجات
//             Expanded(
//               child: GridView.builder(
//                 padding: EdgeInsets.zero,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   childAspectRatio: 157 / 176.32,
//                 ),
//                 itemCount: 10, // مثال: عدد المنتجات
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       // الانتقال إلى صفحة التفاصيل عند الضغط
//                     },
//                     child: Container(
//                       width: 157,
//                       height: 176.32,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 5,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Stack(
//                             children: [
//                               Image.network(
//                                 "https://example.com/product_image.jpg",
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                               Positioned(
//                                 top: 8,
//                                 right: 8,
//                                 child: Icon(Icons.favorite_border, color: Colors.red, size: 20),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             "Product Name",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xFF515E4D),
//                               fontFamily: 'Heebo',
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Size M",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xFF6E726C),
//                                   fontFamily: 'Heebo',
//                                 ),
//                               ),
//                               Text(
//                                 "\$120",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xFF232922),
//                                   fontFamily: 'Heebo',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }