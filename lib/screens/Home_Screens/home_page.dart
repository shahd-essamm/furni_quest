//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
//import 'package:furni_quest/screens/Home_Screens/Empty_cart.dart';
import 'package:furni_quest/screens/Home_Screens/Search_chair.dart';
import 'package:furni_quest/screens/Home_Screens/camera.dart';
import 'package:furni_quest/screens/Home_Screens/cart_page.dart';
import 'package:furni_quest/screens/Home_Screens/categories_page.dart';
import 'package:furni_quest/screens/Home_Screens/chair_page.dart';
import 'package:furni_quest/screens/Home_Screens/my_withlist.dart';
import 'package:furni_quest/screens/Home_Screens/product_page.dart';
//import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // File? image;
  // List<Map<String, dynamic>> cartItems = [];
  //
  // Future pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //
  //     final ImageTemporary = File(image.path);
  //     setState(() {
  //       this.image = ImageTemporary;
  //     });
  //   } on PlatformException catch (e) {
  //     print(('Failed to pick Image:$e'));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black, size: 16),
                Text(
                  'New Cairo, Egypt',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'What are you looking for?',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.qr_code_scanner, color: Colors.grey),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CameraScreen()),);
                           // pickImage(ImageSource.camera);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onFieldSubmitted: (value) {
                    if (value.toLowerCase() == 'chair') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchChairScreen()),
                      );
                    }
                  },
                ),
              ),
            ),

            // Slider
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/UrOurDesign.png',
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/BedRoom.jpeg',
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/LivingRoom.jpeg',
                  fit: BoxFit.fitWidth,
                ),
              ],
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),

            // Horizontal List (Shop by Category)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Shop by Category',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CategoryCard(
                      title: 'Dressing',
                      image: 'assets/DressingSmall.png',
                    ),
                  ),
                  CategoryCard(
                    title: 'Lighting',
                    image: 'assets/Lighting.png',
                  ),
                  CategoryCard(
                    title: 'Coffee Corner',
                    image: 'assets/CoffeeCorner.png',
                  ),
                  CategoryCard(
                    title: 'Table',
                    image: 'assets/WhiteTableSmall.png',
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChairScreen(),
                        ),
                      );
                    },
                    child: CategoryCard(
                      title: 'Chairs',
                      image: 'assets/BrownChairSmall.png',
                    ),
                  ),
                  CategoryCard(
                    title: 'Dressing',
                    image: 'assets/DressingSmall.png',
                  ),
                  CategoryCard(
                    title: 'Lighting',
                    image: 'assets/Lighting.png',
                  ),
                ],
              ),
            ),

            // New Arrivals (separate section for images only)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'New Arrivals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NewArrivalImage(image: 'assets/BlackChair.png'),
                  NewArrivalImage(image: 'assets/BedRoomSmall.png'),
                  NewArrivalImage(image: 'assets/LightingDark.png'),
                  NewArrivalImage(image: 'assets/BlackChair.png'),
                ],
              ),
            ),

            // Recommended For You
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recommended For You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              children: [
                ProductCard(
                  title: 'Brown Chair',
                  image: 'assets/BrownChair.png',
                  price: 200,
                  rating: 4,
                ),
                ProductCard(
                  title: 'Brown Storage',
                  image: 'assets/BrownStorage.png',
                  price: 100,
                  rating: 3,
                ),
                ProductCard(
                  title: 'Vanilla Seat',
                  image: 'assets/VanillaSet.png',
                  price: 200,
                  rating: 4,
                ),
                ProductCard(
                  title: 'White Table',
                  image: 'assets/WhiteTable.png',
                  price: 200,
                  rating: 4,
                ),
                ProductCard(
                  title: 'Wood Bed',
                  image: 'assets/WoodBed.png',
                  price: 200,
                  rating: 5,
                ),
                ProductCard(
                  title: 'Green Sofa',
                  image: 'assets/GreenSofa.png',
                  price: 200,
                  rating: 4,
                ),
              ],
            ),
          ],
        ),
      ),

      // Add the custom BottomNavBar here
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

// New Arrival Image Widget
class NewArrivalImage extends StatelessWidget {
  final String image;

  NewArrivalImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 103,
        height: 98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            height: 98, // Adjust height for image
            width: 103,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// Product Card Widget
class ProductCard extends StatefulWidget {
  final String title;
  final String image;
  final double price;
  final int rating;

  ProductCard({
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              title: widget.title,
              image: widget.image,
              price: widget.price,
              rating: widget.rating,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Image.asset(widget.image, width: double.infinity, height: 110,),
                ),
                Positioned(
                  right: 1,
                  top: 3,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < widget.rating ? Icons.star : Icons.star_border,
                        size: 16,
                        color: Colors.orangeAccent,
                      );
                    }),
                  ),
                  Text(
                    '\$${widget.price.toString()}',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Custom BottomNavBar (copied from CategoriesPage)
class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 70,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(context, Icons.home, "HomePage"),
          _buildNavItem(context, Icons.grid_view, "Categories"),
          _buildNavItem(context, Icons.qr_code_scanner, "scann"),
          _buildNavItem(context, Icons.shopping_bag, "Cart"),
          _buildNavItem(context, Icons.person, "Profile"),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String page) {
    return GestureDetector(
      onTap: () {
        if (page == "HomePage") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
        if (page == "Categories") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoriesPage(),
            ),
          );
        }
        if (page == "Cart") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: page == "HomePage" ? Color(0xFFB9C5B1) : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 24,
          color: Color(0xFF53634F),
        ),
      ),
    );
  }
}

// CategoryCard remains unchanged
class CategoryCard extends StatefulWidget {
  final String title;
  final String image;

  CategoryCard({required this.title, required this.image});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            Container(
              height: 64,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.title,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}







// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/services.dart';
// import 'package:furni_quest/screens/Home_Screens/Empty_cart.dart';
// import 'package:furni_quest/screens/Home_Screens/Search_chair.dart';
// import 'package:furni_quest/screens/Home_Screens/cart_page.dart';
// import 'package:furni_quest/screens/Home_Screens/categories_page.dart';
// import 'package:furni_quest/screens/Home_Screens/chair_page.dart';
// import 'package:furni_quest/screens/Home_Screens/my_withlist.dart';
// import 'package:furni_quest/screens/Home_Screens/product_page.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? image;
//
//   Future pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//
//       final ImageTemporary = File(image.path);
//       setState(() {
//         this.image = ImageTemporary;
//       });
//     } on PlatformException catch (e) {
//       print(('Failed to pick Image:$e'));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Location',
//               style: TextStyle(fontSize: 12, color: Colors.grey),
//             ),
//             Row(
//               children: [
//                 Icon(Icons.location_on, color: Colors.black, size: 16),
//                 Text(
//                   'New Cairo, Egypt',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite_border, color: Colors.black),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => WishlistScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.notifications_none, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search Field
//             // Padding(
//             //   padding: const EdgeInsets.all(16),
//             //   child: Container(
//             //     height: 45,
//             //     child: TextFormField(
//             //       decoration: InputDecoration(
//             //         hintText: 'What are you looking for?',
//             //         prefixIcon: Icon(Icons.search, color: Colors.grey),
//             //         suffixIcon: Icon(Icons.qr_code_scanner, color: Colors.grey),
//             //         border: OutlineInputBorder(
//             //           borderRadius: BorderRadius.circular(10),
//             //           borderSide: BorderSide(color: Colors.grey.shade300),
//             //         ),
//             //         filled: true,
//             //         fillColor: Colors.white,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//
//
//             // Padding(
//             //   padding: const EdgeInsets.all(16),
//             //   child: Container(
//             //     height: 45,
//             //     child: TextFormField(
//             //       decoration: InputDecoration(
//             //         hintText: 'What are you looking for?',
//             //         prefixIcon: Icon(Icons.search, color: Colors.grey),
//             //         suffixIcon: Icon(Icons.qr_code_scanner, color: Colors.grey),
//             //         border: OutlineInputBorder(
//             //           borderRadius: BorderRadius.circular(10),
//             //           borderSide: BorderSide(color: Colors.grey.shade300),
//             //         ),
//             //         filled: true,
//             //         fillColor: Colors.white,
//             //       ),
//             //       onFieldSubmitted: (value) {
//             //         if (value.toLowerCase() == 'chair') {
//             //           Navigator.push(
//             //             context,
//             //             MaterialPageRoute(builder: (context) => SearchChairScreen()),
//             //           );
//             //         }
//             //       },
//             //     ),
//             //   ),
//             // ),
//
//
//
//         Padding(
//         padding: const EdgeInsets.all(16),
//         child: Container(
//           height: 45,
//           child: TextFormField(
//             decoration: InputDecoration(
//               hintText: 'What are you looking for?',
//               prefixIcon: Icon(Icons.search, color: Colors.grey),
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.qr_code_scanner, color: Colors.grey),
//                 onPressed: () {
//                   pickImage(ImageSource.camera);
//                 //  print('QR Code Scanner Icon Clicked');
//                 },
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.grey.shade300),
//               ),
//               filled: true,
//               fillColor: Colors.white,
//             ),
//             onFieldSubmitted: (value) {
//               if (value.toLowerCase() == 'chair') {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SearchChairScreen()),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//
//
//
//             // Slider
//             CarouselSlider(
//               items: [
//                 Image.asset(
//                   'assets/UrOurDesign.png',
//                   fit: BoxFit.fitWidth,
//                 ),
//                 Image.asset(
//                   'assets/BedRoom.jpeg',
//                   fit: BoxFit.fitWidth,
//                 ),
//                 Image.asset(
//                   'assets/LivingRoom.jpeg',
//                   fit: BoxFit.fitWidth,
//                 ),
//               ],
//               options: CarouselOptions(
//                 height: 180,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//               ),
//             ),
//
//             // Horizontal List (Shop by Category)
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Shop by Category',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: CategoryCard(
//                       title: 'Dressing',
//                       image: 'assets/DressingSmall.png',
//                     ),
//                   ),
//                   CategoryCard(
//                     title: 'Lighting',
//                     image: 'assets/Lighting.png',
//                   ),
//                   CategoryCard(
//                     title: 'Coffee Corner',
//                     image: 'assets/CoffeeCorner.png',
//                   ),
//                   CategoryCard(
//                     title: 'Table',
//                     image: 'assets/WhiteTableSmall.png',
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ChairScreen(),
//                         ),
//                       );
//                     },
//                     child: CategoryCard(
//                       title: 'Chairs',
//                       image: 'assets/BrownChairSmall.png',
//                     ),
//                   ),
//                   CategoryCard(
//                     title: 'Dressing',
//                     image: 'assets/DressingSmall.png',
//                   ),
//                   CategoryCard(
//                     title: 'Lighting',
//                     image: 'assets/Lighting.png',
//                   ),
//                 ],
//               ),
//             ),
//
//             // New Arrivals
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'New Arrivals',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   ProductCard(image: 'assets/BlackChair.png'),
//                   ProductCard(image: 'assets/BedRoomSmall.png'),
//                   ProductCard(image: 'assets/LightingDark.png'),
//
//                   ProductCard(image: 'assets/BlackChair.png'),
//                 ],
//               ),
//             ),
//
//             // Recommended For You
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Recommended For You',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             GridView.count(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               shrinkWrap: true,
//               physics: BouncingScrollPhysics(),
//               padding: const EdgeInsets.all(16.0),
//               children: [
//                 ProductCard(
//                   title: 'Brown Chair',
//                   image: 'assets/BrownChair.png',
//                   price: 200,
//                   rating: 4,
//                 ),
//                 ProductCard(
//                   title: 'Brown Storage',
//                   image: 'assets/BrownStorage.png',
//                   price: 100,
//                   rating: 3,
//                 ),
//                 ProductCard(
//                   title: 'Vanilla Seat',
//                   image: 'assets/VanillaSet.png',
//                   price: 200,
//                   rating: 4,
//                 ),
//                 ProductCard(
//                   title: 'White Table',
//                   image: 'assets/WhiteTable.png',
//                   price: 200,
//                   rating: 4,
//                 ),
//                 ProductCard(
//                   title: 'Wood Bed',
//                   image: 'assets/WoodBed.png',
//                   price: 200,
//                   rating: 5,
//                 ),
//                 ProductCard(
//                   title: 'Green Sofa',
//                   image: 'assets/GreenSofa.png',
//                   price: 200,
//                   rating: 4,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//
//       // Add the custom BottomNavBar here
//       bottomNavigationBar: BottomNavBar(),
//     );
//   }
// }
//
// // Custom BottomNavBar (copied from CategoriesPage)
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 340,
//       height: 70,
//       margin: EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(28),
//         border: Border.all(color: Colors.grey.shade300, width: 1),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             offset: Offset(0, 2),
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildNavItem(context, Icons.home, "HomePage"),
//           _buildNavItem(context, Icons.grid_view, "Categories"),
//           _buildNavItem(context, Icons.qr_code_scanner, "scann"),
//           _buildNavItem(context, Icons.shopping_bag, "Cart"),
//           _buildNavItem(context, Icons.person, "Profile"),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem(BuildContext context, IconData icon, String page) {
//     return GestureDetector(
//       onTap: () {
//         if (page == "HomePage") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomeScreen(),
//             ),
//           );
//         }
//         if (page=="Categories"){
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CategoriesPage(),
//             ),
//           );
//         }
//         if (page=="Cart"){
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => EmptyCartPage(),//CartScreen(cartItems: [],)
//             ),
//           );
//         }
//
//       },
//       child: Container(
//         width: 50,
//         height: 50,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: page == "HomePage" ? Color(0xFFB9C5B1) : Colors.transparent,
//         ),
//         child: Icon(
//           icon,
//           size: 24,
//           color: Color(0xFF53634F),
//         ),
//       ),
//     );
//   }
// }
//
// // CategoryCard and ProductCard widgets remain unchanged
// class CategoryCard extends StatelessWidget {
//   final String title;
//   final String image;
//
//   CategoryCard({required this.title, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 0.0),
//         child: Column(
//           children: [
//             Container(
//               height: 64,
//               width: 70,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               title,
//               style: TextStyle(fontSize: 14, color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ProductCard extends StatelessWidget {
//   final String? title;
//   final String image;
//   final double? price;
//   final int? rating;
//
//   ProductCard({
//     this.title,
//     required this.image,
//     this.price,
//     this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetailsScreen(
//               title: title ?? "No Title",
//               image: image,
//               price: price ?? 0.0,
//               rating: rating ?? 0,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         width: 98,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image section
//             SizedBox(
//               height: 100, // Fixed height for the image
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   image,
//                   height: 400,
//                   width: double.infinity,
//                 ),
//               ),
//             ),
//             // Details Section
//             if (title != null || price != null || rating != null) ...[
//               Padding(
//                 padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (title != null)
//                       Text(
//                         title!,
//                         style: TextStyle(fontSize: 14, color: Colors.black),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     if (rating != null || price != null) ...[
//                       SizedBox(height: 4),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // Rating stars
//                           if (rating != null)
//                             Row(
//                               children: List.generate(5, (index) {
//                                 return Icon(
//                                   Icons.star,
//                                   color: index < rating! ? Colors.amber : Colors.grey,
//                                   size: 16,
//                                 );
//                               }),
//                             ),
//                           // Price aligned to the right
//                           if (price != null)
//                             Text(
//                               '\$${price!.toStringAsFixed(2)}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green,
//                               ),
//                             ),
//                         ],
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ]
//           ],
//         ),
//       ),
//     );
//   }
// }