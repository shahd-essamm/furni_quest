import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/category_card_list_view.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/custom_search_field.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/new_arrivals_list_view.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/recommended_grid_view.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/wish_list_view.dart';
import 'package:furni_quest/features/notifications/presentation/views/empty_notification_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xff6E726C),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/Location.svg"),
                SizedBox(
                  width: 6,
                ),
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WishListView(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/favorite-ouline.svg',
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmptyNotificationsView(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/Notification.svg',
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ), // Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomSearchField(
                isSearch: false,
              ),
            ),
            SizedBox(
              height: 24,
            ),

            // Slider
            CustomCarouselSlider(),
            SizedBox(
              height: 24,
            ),
            // Horizontal List (Shop by Category)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Shop by Category',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),

            // Category Cards
            CategoryCardListView(),
            SizedBox(
              height: 16,
            ),
            // New Arrivals (separate section for images only)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'New Arrivals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            NewArrivalsListView(),
            SizedBox(
              height: 16,
            ),
            // Recommended For You
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recommended For You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RecommendedGridView(),
          ],
        ),
      ),
    );
  }
}
