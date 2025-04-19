// import 'package:flutter/material.dart';
// import 'package:furni_quest/features/home/presentation/views/home_view.dart';

// class EmptyCartPage extends StatefulWidget {
//   const EmptyCartPage({super.key});

//   @override
//   State<EmptyCartPage> createState() => _EmptyCartPageState();
// }

// class _EmptyCartPageState extends State<EmptyCartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "My Cart",
//           style: TextStyle(
//             fontFamily: 'Heebo',
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF3A3E39),
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment:
//               CrossAxisAlignment.center, // لتوسيط المحتوى أفقيًا
//           children: [
//             SizedBox(height: 100),
//             SizedBox(
//               width: 178,
//               height: 244,
//               child: Image.asset(
//                   'assets/EmptyCart_image/EmptyCart.png'), // استبدل بالصورة الخاصة بك
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Your cart is empty!",
//               style: TextStyle(
//                 fontFamily: 'Heebo',
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF3A3E39),
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "You have no items in your shopping cart.\nLet’s go buy something",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: 'Heebo',
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Color(0xFF646B62),
//               ),
//             ),
//             SizedBox(height: 25),
//             SizedBox(
//               width: 264,
//               height: 44,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF657660),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: () {
//                   // انتقل إلى الصفحة المطلوبة عند الضغط على الزر

//                   Navigator.pushReplacementNamed(
//                     context,
//                     HomeView.routeName,
//                   );
//                 },
//                 child: Text(
//                   "Continue Shopping",
//                   style: TextStyle(
//                     fontFamily: 'Heebo',
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


















// // import 'package:flutter/material.dart';
// //
// // class EmptyCartPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           "My Cart",
// //           style: TextStyle(
// //             fontFamily: 'Heebo',
// //             fontSize: 18,
// //             fontWeight: FontWeight.w600,
// //             color: Color(0xFF3A3E39),
// //           ),
// //         ),
// //         centerTitle: true,
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           SizedBox(
// //             width: 178,
// //             height: 244,
// //             child: Image.asset('assets/EmptyCart_image/EmptyCart.png'), // استبدل بالصورة الخاصة بك
// //           ),
// //           SizedBox(height: 20),
// //           Text(
// //             "Your cart is empty!",
// //             style: TextStyle(
// //               fontFamily: 'Heebo',
// //               fontSize: 18,
// //               fontWeight: FontWeight.w600,
// //               color: Color(0xFF3A3E39),
// //             ),
// //           ),
// //           SizedBox(height: 10),
// //           Text(
// //             "You have no items in your shopping cart.\nLet’s go buy something",
// //             textAlign: TextAlign.center,
// //             style: TextStyle(
// //               fontFamily: 'Heebo',
// //               fontSize: 14,
// //               fontWeight: FontWeight.w500,
// //               color: Color(0xFF646B62),
// //             ),
// //           ),
// //           SizedBox(height: 30),
// //           SizedBox(
// //             width: 264,
// //             height: 44,
// //             child: ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Color(0xFF657660),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //               ),
// //               onPressed: () {
// //                 // انتقل إلى الصفحة المطلوبة عند الضغط على الزر
// //               },
// //               child: Text(
// //                 "Continue Shopping",
// //                 style: TextStyle(
// //                   fontFamily: 'Heebo',
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.w500,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }