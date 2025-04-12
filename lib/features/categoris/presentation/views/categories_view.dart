import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  Map<String, bool> expandedState = {
    "Bed Room": false,
    "Dining Room": false,
    "Living Room": false,
    "Outdoors": false,
  };

  final List<CategoryItem> categories = [
    CategoryItem(
      title: "Bed Room",
      image: "assets/categories_image/BedRoom.png",
      subItems: [
        SubItem(name: "Beds", image: "assets/categories_image/Beds.png"),
        SubItem(
            name: "Room Sets", image: "assets/categories_image/RoomSets.png"),
        SubItem(
            name: "Commodes", image: "assets/categories_image/Commodes.png"),
        SubItem(
            name: "Dressing", image: "assets/categories_image/Dressing.png"),
      ],
    ),
    CategoryItem(
      title: "Dining Room",
      image: "assets/categories_image/DiningRoom.png",
      subItems: [
        SubItem(
            name: "Dining Tables",
            image: "assets/categories_image/DiningTables.png"),
        SubItem(
            name: "Lighting", image: "assets/categories_image/Lighting.png"),
      ],
    ),
    CategoryItem(
      title: "Living Room",
      image: "assets/categories_image/LivingRoom.png",
      subItems: [
        SubItem(
            name: "TV Units", image: "assets/categories_image/TV Units.png"),
        SubItem(name: "Chairs", image: "assets/categories_image/Chairs.png"),
        SubItem(
            name: "Coffee Corners",
            image: "assets/categories_image/CoffeeCorners.png"),
      ],
    ),
    CategoryItem(
      title: "Outdoors",
      image: "assets/categories_image/OutdoorsRoom.png",
      subItems: [
        SubItem(
            name: "Outdoor Chair",
            image: "assets/categories_image/OutdoorChair.png"),
        SubItem(
            name: "Wooden Side Tables",
            image: "assets/categories_image/WoodenSideTables.png"),
        SubItem(
            name: "Steel Outdoor",
            image: "assets/categories_image/Steel Outdoor.png"),
      ],
    ),
  ];

  void toggleExpansion(String title) {
    setState(() {
      expandedState[title] = !expandedState[title]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3A3E39),
                ),
              ),
              SizedBox(height: 22),
              Expanded(
                child: ListView(
                  children: categories.map((category) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () => toggleExpansion(category.title),
                          child: Container(
                            width: 365,
                            height: 156,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(category.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: 365,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        category.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF3A3E39),
                                        ),
                                      ),
                                      Icon(
                                        expandedState[category.title]!
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (expandedState[category.title]!)
                          ...category.subItems.map((subItem) {
                            return Container(
                              width: 365,
                              height: 44,
                              margin: EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 2),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      subItem.name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF232922),
                                      ),
                                    ),
                                    Image.asset(
                                      subItem.image,
                                      width: 109,
                                      height: 44,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        SizedBox(height: 20), // Add space between categories
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final String image;
  final List<SubItem> subItems;
  CategoryItem(
      {required this.title, required this.image, required this.subItems});
}

class SubItem {
  final String name;
  final String image;
  SubItem({required this.name, required this.image});
}
