import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furni_quest/features/home/data/models/sub_category_model/sub_category_model.dart';
import 'package:furni_quest/features/home/presentation/widgets/category/category_card_list_view.dart';
import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/custom_carousel_slider.dart';
import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/custom_search_field.dart';
import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/wish_list_view.dart';
import 'package:furni_quest/features/home/presentation/widgets/new_arrivals/new_arrivals_list_view.dart';
import 'package:furni_quest/features/home/presentation/widgets/recommended_for_you/recommended_grid_view.dart';
import 'package:furni_quest/features/notifications/presentation/views/empty_notification_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<SubCategory> allCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Adjust as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
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
                  SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset("assets/Location.svg"),
                      SizedBox(width: 6),
                      Text(
                        'New Cairo, Egypt',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
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
                          child: SvgPicture.asset('assets/favorite-ouline.svg'),
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
                          child: SvgPicture.asset('assets/Notification.svg'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomSearchField(isSearch: false),
            ),
            SizedBox(height: 24),
            CustomCarouselSlider(),
            SizedBox(height: 24),
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
            SizedBox(height: 16),
            CategoryCardListView(),
            SizedBox(height: 16),
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
            SizedBox(height: 16),
            NewArrivalsListView(),
            SizedBox(height: 16),
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
