import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/camera_view.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/search_chair_view.dart';
import 'package:furni_quest/features/search/presentation/views/search_view.dart';

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
          suffixIcon: IconButton(
            icon: Icon(
              isSearch ? Icons.filter_list : Icons.qr_code_scanner,
              color: Colors.grey,
            ),
            onPressed: () {
              isSearch
                  ? null
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraView(),
                      ),
                    );
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
