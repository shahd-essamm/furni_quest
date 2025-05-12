import 'package:flutter/material.dart';
import 'package:furni_quest/features/discovery/presentation/views/recommendation_view.dart';
import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
  static const String routeName = 'main-view';
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          if (index == 2) {
            showDialogAiOrAr(context);
          } else {
            setState(() {
              currentViewIndex = index;
            });
          }
        },
      ),
      body: SafeArea(
        child: MainViewBody(currentViewIndex: currentViewIndex),
      ),
    );
  }

  Future<dynamic> showDialogAiOrAr(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/visualize_in_Room_ar.png",
                            height: 120,
                            width: 95,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Visualize in Room",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecommendationView(),
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/style_assistant_ai.png",
                              height: 120,
                              width: 95,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Style Assistant",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
