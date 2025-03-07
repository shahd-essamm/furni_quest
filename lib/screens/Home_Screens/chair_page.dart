import 'package:flutter/material.dart';

class ChairScreen extends StatefulWidget {
  @override
  _ChairScreenState createState() => _ChairScreenState();
}

class _ChairScreenState extends State<ChairScreen> {
  final List<Map<String, dynamic>> chairs = [
    {"name": "Light Grey Chair", "price": "\$200", "image": "assets/chair_image/LightgreyChair.png", "rating": 4, "isFavorite": false},
    {"name": "Brown Chair", "price": "\$200", "image": "assets/chair_image/BrownChair.png", "rating": 3, "isFavorite": false},
    {"name": "Grey Chair", "price": "\$200", "image": "assets/chair_image/GreyChair.png", "rating": 5, "isFavorite": false},
    {"name": "Green Chair", "price": "\$200", "image": "assets/chair_image/GreenChair.png", "rating": 4, "isFavorite": false},
    {"name": "Dark Grey Chair", "price": "\$200", "image": "assets/chair_image/DarkGreyChair.png", "rating": 3, "isFavorite": false},
    {"name": "Outdoor Chair", "price": "\$200", "image": "assets/chair_image/OutdoorChair.png", "rating": 4, "isFavorite": false},
    {"name": "Vanilla Chair", "price": "\$200", "image": "assets/chair_image/VanillaChair.png", "rating": 5, "isFavorite": false},
    {"name": "Light Chair", "price": "\$200", "image": "assets/chair_image/LightChair.png", "rating": 4, "isFavorite": false},
  ];

  void toggleFavorite(int index) {
    setState(() {
      chairs[index]['isFavorite'] = !chairs[index]['isFavorite'];
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
        title: Text(
          "Chair",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Heebo',
            color: Color(0xFF3A3E39),
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          width: 380,
          height: 741.26,
          padding: const EdgeInsets.all(8.0),
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
                  // قم بإضافة التنقل إلى الصفحة المطلوبة هنا
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
            crossAxisAlignment: CrossAxisAlignment.start, // يجعل العناصر تبدأ من اليسار
            children: [
              Center(
                child: SizedBox( height: 150,
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
                    // النجوم محاذاة لليسار
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          size: 14,
                          color: Colors.amber,
                        );
                      }),
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





// import 'package:flutter/material.dart';
//
//
// class ChairScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> chairs = [
//     {"name": "Light Grey Chair", "price": "\$200", "image": "assets/chair_image/LightgreyChair.png", "rating": 4},
//     {"name": "Brown Chair", "price": "\$200", "image": "assets/chair_image/BrownChair.png","rating": 3},
//     {"name": "Grey Chair", "price": "\$200", "image": "assets/chair_image/GreyChair.png", "rating": 5},
//     {"name": "Green Chair", "price": "\$200", "image": "assets/chair_image/GreenChair.png", "rating": 4},
//     {"name": "Dark Grey Chair", "price": "\$200", "image": "assets/chair_image/DarkGreenChair.png", "rating": 3},
//     {"name": "Outdoor Chair", "price": "\$200", "image": "assets/chair_image/OutdoorChair.png", "rating": 4},
//     {"name": "Vanilla Chair", "price": "\$200", "image": "assets/chair_image/VanillaChair.png", "rating": 5},
//     {"name": "Light Chair", "price": "\$200", "image": "assets/chair_image/LightChair.png", "rating": 4},
//   ];
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
//             Navigator.pop(context); // يرجع إلى الصفحة السابقة
//           },
//         ),
//         title: Text(
//           "Chair",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             fontFamily: 'Heebo',
//             color: Color(0xFF3A3E39),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           itemCount: chairs.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//             childAspectRatio: 157 / 176.32,
//           ),
//           itemBuilder: (context, index) {
//             final chair = chairs[index];
//             return ChairCard(
//               name: chair['name']!,
//               price: chair['price']!,
//               imagePath: chair['image']!,
//               rating: chair['rating']!,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class ChairCard extends StatelessWidget {
//   final String name;
//   final String price;
//   final String imagePath;
//   final int rating;
//
//   const ChairCard({
//     required this.name,
//     required this.price,
//     required this.imagePath,
//     required this.rating,
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
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             imagePath,
//             width: 100,
//             height: 100,
//             fit: BoxFit.contain,
//           ),
//           SizedBox(height: 8),
//           Text(
//             name,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//               fontFamily: 'Heebo',
//               color: Color(0xFF515E4D),
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 4),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Row(
//                   children: List.generate(5, (index) {
//                     return Icon(
//                       index < rating ? Icons.star : Icons.star_border,
//                       size: 14,
//                       color: Colors.amber,
//                     );
//                   }),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Text(
//                   price,
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: 'Heebo',
//                     color: Color(0xFF232922),
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