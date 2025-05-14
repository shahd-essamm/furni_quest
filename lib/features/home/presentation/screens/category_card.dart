// import 'package:flutter/material.dart';
// import 'package:furni_quest/features/home/data/models/sub_category_model.dart';

// class CategoryCardItem extends StatelessWidget {
//   final SubCategory subCategory;
//   final void Function()? onTap;

//   const CategoryCardItem({
//     super.key,
//     required this.subCategory,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: SizedBox(
//         width: 70,
//         child: Column(
//           children: [
//             Container(
//               height: 64,
//               width: 70,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: NetworkImage(subCategory.image??''),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               subCategory.name??'',
//               textAlign: TextAlign.center,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontSize: 14, color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
