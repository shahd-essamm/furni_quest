import 'package:flutter/material.dart';
import 'package:furni_quest/screens/create_acount.dart';
import 'package:furni_quest/screens/sign_in_screen.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool isCodeWrong = false; // حالة الكود (صحيح/خطأ)
  bool isCodeVerified = false; // حالة التحقق من الكود

  void verifyCode() {
    // تحقق من صحة الكود
    if (_codeController.text == "1234") { // الكود الصحيح
      setState(() {
        isCodeWrong = false;
        isCodeVerified = true; // الكود تم تأكيده
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
    } else {
      setState(() {
        isCodeWrong = true; // الكود خاطئ
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF3A3E39)),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => CreateAccountScreen(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Verify Code",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Color(0xFF3A3E39),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter the code we just sent to email\nMariamsobhy@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF646B62),
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: isCodeWrong ? Color(0xFFD73F2C) : Color(0xFFC3C9C0),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF646B62),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "", // Removes the character counter below the input
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus(); // Move to next box
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus(); // Move to previous box
                      }
                      // Update _codeController.text dynamically
                      setState(() {
                        List<String> currentCode = _codeController.text.split('');
                        if (currentCode.length < 4) {
                          currentCode = List.generate(4, (i) => i < currentCode.length ? currentCode[i] : "");
                        }
                        currentCode[index] = value;
                        _codeController.text = currentCode.join();
                      });
                    },
                  ),
                );
              }),
            ),

            SizedBox(height: 16),
            Text(
              "Didn’t receive Code?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF3B3A35),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // إجراء لإعادة إرسال الكود
              },
              child: Text(
                "Resend Code",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF657660),
                ),
              ),
            ),
            Spacer(),
            if (isCodeVerified)
              Text(
                "Code Verified Successfully!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF53634F),
                ),
              ),
            SizedBox(
              width: 335,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCodeVerified
                      ? Color(0xFF53634F)
                      : Color(0xFFE5E8E3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: verifyCode,
                child: Text(
                  "Verify",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
//
//
// class VerifyScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: VerifyCodeScreen(),
//     );
//   }
// }
//
// class VerifyCodeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back, size: 24),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 32),
//             Text(
//               "Verify Code",
//               style: TextStyle(
//                 fontFamily: 'Heebo',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 24,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               "Please enter the code we just sent to email\nMariamSobhy@gmail.com",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: 'Heebo',
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14,
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(4, (index) {
//                 return Container(
//                   width: 48,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "-",
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Didn't receive Code?",
//                   style: TextStyle(
//                     fontFamily: 'Heebo',
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Resend Code",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Spacer(),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(335, 44),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 backgroundColor: Colors.green[100],
//               ),
//               child: Text(
//                 "Verify",
//                 style: TextStyle(
//                   fontFamily: 'Heebo',
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class VerifyScreen extends StatelessWidget {
//   const VerifyScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: VerifyScreen(),
//     );
//   }
// }

// class VerifyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // الحصول على أبعاد الشاشة
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: screenHeight * 0.02),
//             Text(
//               "Verify Code",
//               style: TextStyle(
//                 fontSize: screenWidth * 0.05,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.01),
//             Text(
//               "Please enter the code we just sent to email\nMariamSobhy@gmail.com",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: screenWidth * 0.035,
//                 color: Colors.grey[700],
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.05),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(4, (index) {
//                 return Container(
//                   width: screenWidth * 0.12,
//                   height: screenWidth * 0.12,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Center(
//                     child: Text(
//                       '-',
//                       style: TextStyle(fontSize: screenWidth * 0.07),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//             SizedBox(height: screenHeight * 0.03),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Didn't receive Code?",
//                 style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey[700]),
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Resend Code",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.035,
//                   color: Colors.green,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Spacer(),
//             SizedBox(
//               width: screenWidth * 0.9,
//               height: screenHeight * 0.06,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green[100],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   "Verify",
//                   style: TextStyle(
//                     fontSize: screenWidth * 0.045,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.05),
//           ],
//         ),
//       ),
//     );
//   }
// }