import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/camera_view.dart';
import 'package:furni_quest/features/home/presentation/widgets/custom_widgets/search_chair_view.dart';
import 'package:furni_quest/features/search/presentation/views/search_view.dart';
import 'package:furni_quest/features/search/presentation/views/widgets/filter_bottom_sheet.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.isSearch,
  });

  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        readOnly: !isSearch,
        onTap: () {
          isSearch
              ? null
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ),
                );
        },
        decoration: InputDecoration(
          hintText: 'What are you looking for?',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: isSearch
              ? IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      sheetAnimationStyle: AnimationStyle(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                      ),
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      builder: (context) => FilterBottomSheet(
                        onApply: (filters) {
                          print(filters); // اعمل فلترة باستخدام القيم المختارة
                        },
                      ),
                    );
                  },
                )
              : Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CameraView(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/Scan.svg",
                      width: 16,
                      height: 16,
                    ),
                  ),
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
            Navigator.pushNamed(
              context,
              SearchChairView.routeName,
            );
          }
        },
      ),
    );
  }
}
