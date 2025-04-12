import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/views/widgets/new_arrivals_item.dart';

class NewArrivalsListView extends StatelessWidget {
  const NewArrivalsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 103,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) =>
            NewArrivalItem(image: 'assets/BlackChair.png'),
      ),
    );
  }
}
