import 'package:flutter/material.dart';

import 'create_acount.dart';
import 'sign_in_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Stack للصورة والنص
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/Background Container.png', // استبدل بمسار الصورة الخاص بك
                    width: MediaQuery.of(context).size.width,
                    height: 550,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 15,  // تغيير المسافة بين النصين
                    child: Text(
                      "The FurniQuest App",
                      style: const TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F4C43),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,  // وضع الجملة الثانية أقرب إلى الأولى
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Step into a world of comfort and style. Discover furniture that elevates your home's ambiance.",
                        style: TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF768571),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CreateAccountScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF657660), // تغيير لون الزر
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(
                      color: Color(0xFF657660),
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(335, 44),
                  ),
                  child: const Text(
                    "Let’s Get Started",
                    style: TextStyle(
                      fontFamily: 'Heebo',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // النص باللون الأبيض
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontFamily: 'Heebo',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3B3A35),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF657660),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:furni_quest/screens/create_acount.dart';
// class OnBoarding extends StatelessWidget {
//   const OnBoarding({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//        return  Scaffold(
//          backgroundColor: Colors.white,
//          body: SafeArea(
//            child: SingleChildScrollView(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  // Stack للصورة والنص
//                  Stack(
//                    alignment: Alignment.center,
//                    children: [
//                      Image.asset(
//                        'assets/Background Container.png', // استبدل بمسار الصورة الخاص بك
//                        width: MediaQuery.of(context).size.width * 1,
//                        height: 550,
//                        fit: BoxFit.cover,
//                      ),
//                      Positioned(
//                        bottom: 16,
//                        child: Text(
//                          "The FurniQuest App",
//                          style: TextStyle(
//                            fontFamily:'Heebo',
//                            fontSize: 20,
//                            fontWeight: FontWeight.w900,
//                            color: (const Color.fromARGB(255, 79, 76, 67)),
//                            shadows: [
//                              Shadow(
//                                offset: Offset(1, 1),
//                                blurRadius: 5,
//                                color: Colors.black.withOpacity(0.5),
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                  const SizedBox(height: 24),
//                  const Padding(
//                    padding: EdgeInsets.symmetric(horizontal: 24.0),
//                    child: Text(
//                      "Step into a world of comfort and style. Discover furniture that elevates your home's ambiance.",
//                      style: TextStyle(
//                        fontSize: 16,
//                        color: Colors.grey,
//                      ),
//                      textAlign: TextAlign.center,
//                    ),
//                  ),
//                  const SizedBox(height: 24),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                    child: ElevatedButton(
//                      onPressed: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccountScreen()));
//                      },
//                      style: ElevatedButton.styleFrom(
//                        backgroundColor: const Color(0xFF78866B),
//                        padding: const EdgeInsets.symmetric(vertical: 16),
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(8),
//                        ),
//                      ),
//                      child: const Text(
//                        "Let’s Get Started",
//                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                      ),
//                    ),
//                  ),
//                  const SizedBox(height: 16),
//                  TextButton(
//                    onPressed: () {},
//                    child: const Text(
//                      "Already have an account? Sign in",
//                      style: TextStyle(color: Colors.grey),
//                    ),
//                  ),
//                  const SizedBox(height: 24), // للتأكد من وجود مساحة أسفل النص الأخير
//                ],
//              ),
//            ),
//          ),
//        );
//   }
// }






//     Container(
//       color: Colors.white,
//       child: Stack(
//         children: [
//           Positioned(
//             top: -30, // Adjust as needed
//             left: -30, // Adjust as needed
//             child: Image.asset(
//               'assets/BlobShape.png',
//               width: 150, // Adjust the size as needed
//               height: 150,
//             ),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ClipOval(
//                     child: Image.asset(
//                       'assets/photo.png',
//                       width: 200,
//                       height: 250,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 24),
//                   // App Title
//                   Text(
//                     'The FurniQuest App',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Step into a world of comfort and style. Discover\nFurniture that elevates your home\'s ambiance.',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 32),
//                   // "Let's Get Started" button
//                   ElevatedButton(
//                     onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccountScreen()));
//                        // Handle sign-up
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF8AA388),
//                       // Adjust color as needed
//                       padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//
//                       ),
//
//                     ),
//                     child: Text(
//                       'Let\'s Get Started',
//                       style: TextStyle(fontSize: 16,
//                       fontFamily: "Heebo"),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // "Already have an account?" text
//                   TextButton(
//                     onPressed: () {
//                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccountScreen()));
//                       // Handle sign-in
//                     },
//                     child: Text(
//                       'Already have an account? Sign in',
//                       style: TextStyle(
//                         color: Colors.black54,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }