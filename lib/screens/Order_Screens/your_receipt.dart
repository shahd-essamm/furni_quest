import 'package:flutter/material.dart';
import 'package:furni_quest/screens/Order_Screens/payment_successful.dart';

class YourReceiptScreen extends StatefulWidget {
  @override
  _YourReceiptScreenState createState() => _YourReceiptScreenState();
}

class _YourReceiptScreenState extends State<YourReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isSmallScreen = screenWidth < 360; // For small devices

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: screenWidth * 0.85, // Responsive width
                    padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          "Payment Success!",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 16 : 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3B3A35),
                            fontFamily: 'Heebo',
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Your payment has been successfully done.",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 10 : 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3B3A35),
                            fontFamily: 'Heebo',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Divider(color: Color(0xFFB9C5B1)),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          "Total Payment",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 10 : 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4F4C43),
                            fontFamily: 'Heebo',
                          ),
                        ),
                        Text(
                          "\$995",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 20 : 22,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3B3A35),
                            fontFamily: 'Heebo',
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: screenWidth < 400 ? 1 : 2, // Adjust grid dynamically
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2,
                          children: [
                            _buildInfoCard("Ref Number", "000085752257"),
                            _buildInfoCard("Payment Time", "15 April 2024, 13:22"),
                            _buildInfoCard("Payment Method", "Bank Transfer"),
                            _buildInfoCard("Sender Name", "Antonio Roberto"),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.download, color: Color(0xFF657660), size: isSmallScreen ? 18 : 24),
                          label: Text(
                            "Get PDF Receipt",
                            style: TextStyle(
                              color: Color(0xFF657660),
                              fontSize: isSmallScreen ? 10 : 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Heebo',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -22,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 16,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(Icons.check_circle, color: Color(0xFF657660), size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.04),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSuccessScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF53634F),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(screenWidth * 0.85, 44),
              ),
              child: Text(
                "Done",
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  color: Colors.white,
                  fontFamily: 'Heebo',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFB9C5B1)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF657660),
              fontWeight: FontWeight.w400,
              fontFamily: 'Heebo',
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4F4C43),
              fontFamily: 'Heebo',
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
//
// class YourReceiptScreen extends StatefulWidget {
//   @override
//   _YourReceiptScreenState createState() => _YourReceiptScreenState();
// }
//
// class _YourReceiptScreenState extends State<YourReceiptScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 24,
//                     backgroundColor: Colors.green,
//                     child: Icon(Icons.check, color: Colors.white, size: 24),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Payment Success!",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Your payment has been successfully done.",
//                     style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Total Payment",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     "\$995",
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 16),
//                   GridView.count(
//                     shrinkWrap: true,
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     childAspectRatio: 2.5,
//                     children: [
//                       _buildInfoCard("Ref Number", "000085752257"),
//                       _buildInfoCard("Payment Time", "15 April 2024, 13:22"),
//                       _buildInfoCard("Payment Method", "Bank Transfer"),
//                       _buildInfoCard("Sender Name", "Antonio Roberto"),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   TextButton.icon(
//                     onPressed: () {},
//                     icon: Icon(Icons.download, color: Colors.green),
//                     label: Text("Get PDF Receipt", style: TextStyle(color: Colors.green)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 30),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green.shade700,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                 minimumSize: Size(double.infinity, 50),
//               ),
//               child: Text("Done", style: TextStyle(fontSize: 16, color: Colors.white)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInfoCard(String title, String value) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.green.shade300),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 12, color: Colors.green.shade700, fontWeight: FontWeight.w500),
//           ),
//           SizedBox(height: 4),
//           Text(
//             value,
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

































// import 'package:flutter/material.dart';
//
// class YourReceipt extends StatefulWidget {
//   final String senderName;
//   final String paymentMethod;
//   final String paymentTime;
//   final String referenceNumber;
//   final double totalAmount;
//
//   const YourReceipt({
//     Key? key,
//     required this.senderName,
//     required this.paymentMethod,
//     required this.paymentTime,
//     required this.referenceNumber,
//     required this.totalAmount,
//   }) : super(key: key);
//
//   @override
//   _YourReceiptState createState() => _YourReceiptState();
// }
//
// class _YourReceiptState extends State<YourReceipt> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 300,
//               height: 406.96,
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     spreadRadius: 0,
//                     blurRadius: 5,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Image.asset('assets/order_image/Success Icon.png', height: 40),
//                   SizedBox(height: 10),
//                   Text("Payment Success!",
//                       style: TextStyle(
//                           fontFamily: 'Heebo',
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xFF3B3A35))),
//                   SizedBox(height: 4),
//                   Text("Your payment has been successfully done.",
//                       style: TextStyle(
//                           fontFamily: 'Heebo',
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF3B3A35))),
//                   SizedBox(height: 10),
//                   Divider(color: Color(0xFFB9C5B1)),
//                   SizedBox(height: 10),
//                   Text("Total Payment",
//                       style: TextStyle(
//                           fontFamily: 'Heebo',
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF4F4C43))),
//                   SizedBox(height: 5),
//                   Text("\\$${widget.totalAmount.toStringAsFixed(2)}",
//                       style: TextStyle(
//                           fontFamily: 'Heebo',
//                           fontSize: 22,
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xFF3B3A35))),
//                   SizedBox(height: 10),
//                   Wrap(
//                     spacing: 10,
//                     runSpacing: 10,
//                     children: [
//                       _buildInfoCard("Ref Number", widget.referenceNumber),
//                       _buildInfoCard("Payment Time", widget.paymentTime),
//                       _buildInfoCard("Payment Method", widget.paymentMethod),
//                       _buildInfoCard("Sender Name", widget.senderName),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: () {
//                       // Handle PDF download
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.download, color: Color(0xFF4F4C43)),
//                         SizedBox(width: 5),
//                         Text("Get PDF Receipt",
//                             style: TextStyle(
//                                 fontFamily: 'Heebo',
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w500,
//                                 color: Color(0xFF4F4C43))),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.pop(context),
//         backgroundColor: Color(0xFF53634F),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(
//           "Done",
//           style: TextStyle(
//             fontFamily: 'Heebo',
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoCard(String title, String value) {
//     return Container(
//       width: 128,
//       height: 62,
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: Color(0xFFB9C5B1)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title,
//               style: TextStyle(
//                   fontFamily: 'Heebo',
//                   fontSize: 10,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF657660))),
//           SizedBox(height: 4),
//           Text(value,
//               style: TextStyle(
//                   fontFamily: 'Heebo',
//                   fontSize: 11,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF4F4C43))),
//         ],
//       ),
//     );
//   }
// }