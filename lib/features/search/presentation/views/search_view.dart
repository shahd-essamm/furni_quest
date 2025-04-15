import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/custom_search_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const String routeName = 'search_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomSearchField(
              isSearch: true,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.search, color: Colors.grey),
                title: Text(
                  'Chair',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
