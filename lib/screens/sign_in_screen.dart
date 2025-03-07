import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Home_Screens/home_page.dart';
import 'new_password.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // جعل الخلفية بيضاء
      body: SafeArea(
        child: SingleChildScrollView( // جعل المحتوى قابل للتمرير عند ظهور الكيبورد
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 35), // جعل الصورة أعلى الصفحة
                // Logo (Image)
                Container(
                  width: 48,
                  height: 70.71,
                  child: Image.asset('assets/logo_sgin_in.png', fit: BoxFit.contain),
                ),
                const SizedBox(height: 3),
                // "Sign In" text
                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3A3E39),
                  ),
                ),
                const SizedBox(height: 0),
                // Subtitle text
                const Text(
                  "Hi! Welcome back, you’ve been missed",
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF646B62),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 17),
                // Email field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5049),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                      height: 44,
                      child: TextField(
                        style: const TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B2A3),
                        ),
                        decoration: InputDecoration(
                          hintText: "Mariam sobhy654@gmail.com",
                          hintStyle: const TextStyle(
                            fontFamily: 'Heebo',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3A3E39),
                          ),
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Password field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5049),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                      height: 44,
                      child: TextField(
                        obscureText: true,
                        style: const TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B2A3),
                        ),
                        decoration: InputDecoration(
                          hintText: "●●●●●●●",
                          hintStyle: const TextStyle(
                            fontFamily: 'Heebo',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3A3E39),
                          ),
                          suffixIcon: const Icon(Icons.visibility_off_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  NewPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF657660),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                // Sign In button
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF657660),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  HomeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Google Sign In
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                  height: 44,
                  child: OutlinedButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.google),
                    label: const Text(
                      "Sign in with Google",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5049),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 7),
                // Apple Sign In
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40, // تحديد العرض بناءً على العرض المتاح
                  height: 44,
                  child: OutlinedButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.apple),
                    label: const Text(
                      "Sign in with Apple",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5049),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 10),
                // Register link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF3B3A35),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontFamily: 'Heebo',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF657660),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






//دون esponsive
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import 'new_password.dart';
//
//
// class SignInPage extends StatelessWidget {
//   const SignInPage({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const SignInScreen(),
//     );
//   }
// }
//
// class SignInScreen extends StatelessWidget {
//   const SignInScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // جعل الخلفية بيضاء
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 35), // جعل الصورة أعلى الصفحة
//               // Logo (Image)
//               Container(
//                 width: 48,
//                 height: 70.71,
//                 child: Image.asset('assets/logo_sgin_in.png', fit: BoxFit.contain),
//               ),
//               const SizedBox(height: 3),
//               // "Sign In" text
//               const Text(
//                 "Sign In",
//                 style: TextStyle(
//                   fontFamily: 'Heebo',
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF3A3E39),
//                 ),
//               ),
//               const SizedBox(height: 0),
//               // Subtitle text
//               const Text(
//                 "Hi! Welcome back, you’ve been missed",
//                 style: TextStyle(
//                   fontFamily: 'Heebo',
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF646B62),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 17),
//               // Email field
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Email",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF4B5049),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Container(
//                     width: 335,
//                     height: 44,
//                     child: TextField(
//                       style: const TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xFFA7B2A3),
//                       ),
//                       decoration: InputDecoration(
//                         hintText: "Mariam sobhy654@gmail.com",
//                         hintStyle: const TextStyle(
//                           fontFamily: 'Heebo',
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF3A3E39),
//                         ),
//                         prefixIcon: const Icon(Icons.email_outlined),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               // Password field
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Password",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF4B5049),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Container(
//                     width: 335,
//                     height: 44,
//                     child: TextField(
//                       obscureText: true,
//                       style: const TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xFFA7B2A3),
//                       ),
//                       decoration: InputDecoration(
//                         hintText: "●●●●●●●",
//                         hintStyle: const TextStyle(
//                           fontFamily: 'Heebo',
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF3A3E39),
//                         ),
//                         suffixIcon: const Icon(Icons.visibility_off_outlined),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 3),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const NewPasswordPage(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Forget Password?",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF657660),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 3),
//               // Sign In button
//               SizedBox(
//                 width: 335,
//                 height: 44,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF657660),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     "Sign in",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               // Google Sign In
//               SizedBox(
//                 width: 335,
//                 height: 44,
//                 child: OutlinedButton.icon(
//                   icon: const FaIcon(FontAwesomeIcons.google),
//                   label: const Text(
//                     "Sign in with Google",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF4B5049),
//                     ),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               const SizedBox(height: 7),
//               // Apple Sign In
//               SizedBox(
//                 width: 335,
//                 height: 44,
//                 child: OutlinedButton.icon(
//                   icon: const FaIcon(FontAwesomeIcons.apple),
//                   label: const Text(
//                     "Sign in with Apple",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF4B5049),
//                     ),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               const SizedBox(height: 10),
//               // Register link
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Don’t have an account?",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF3B3A35),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       "Sign in",
//                       style: TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF657660),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }















// responsive
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import 'new_password.dart';
//
// class SignInPage extends StatelessWidget {
//   const SignInPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const SignInScreen(),
//     );
//   }
// }
//
// class SignInScreen extends StatelessWidget {
//   const SignInScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // جعل الخلفية بيضاء
//       body: SafeArea(
//         child: SingleChildScrollView( // جعل المحتوى قابل للتمرير عند ظهور الكيبورد
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 35), // جعل الصورة أعلى الصفحة
//                 // Logo (Image)
//                 Container(
//                   width: 48,
//                   height: 70.71,
//                   child: Image.asset('assets/logo_sgin_in.png', fit: BoxFit.contain),
//                 ),
//                 const SizedBox(height: 3),
//                 // "Sign In" text
//                 const Text(
//                   "Sign In",
//                   style: TextStyle(
//                     fontFamily: 'Heebo',
//                     fontSize: 24,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF3A3E39),
//                   ),
//                 ),
//                 const SizedBox(height: 0),
//                 // Subtitle text
//                 const Text(
//                   "Hi! Welcome back, you’ve been missed",
//                   style: TextStyle(
//                     fontFamily: 'Heebo',
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF646B62),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 17),
//                 // Email field
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Email",
//                       style: TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF4B5049),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       width: 335,
//                       height: 44,
//                       child: TextField(
//                         style: const TextStyle(
//                           fontFamily: 'Heebo',
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFFA7B2A3),
//                         ),
//                         decoration: InputDecoration(
//                           hintText: "Mariam sobhy654@gmail.com",
//                           hintStyle: const TextStyle(
//                             fontFamily: 'Heebo',
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xFF3A3E39),
//                           ),
//                           prefixIcon: const Icon(Icons.email_outlined),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 // Password field
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Password",
//                       style: TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF4B5049),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       width: 335,
//                       height: 44,
//                       child: TextField(
//                         obscureText: true,
//                         style: const TextStyle(
//                           fontFamily: 'Heebo',
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFFA7B2A3),
//                         ),
//                         decoration: InputDecoration(
//                           hintText: "●●●●●●●",
//                           hintStyle: const TextStyle(
//                             fontFamily: 'Heebo',
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xFF3A3E39),
//                           ),
//                           suffixIcon: const Icon(Icons.visibility_off_outlined),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 3),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const NewPasswordPage(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Forget Password?",
//                       style: TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF657660),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 3),
//                 // Sign In button
//                 SizedBox(
//                   width: 335,
//                   height: 44,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF657660),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       "Sign in",
//                       style: TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 // Google Sign In
//                 SizedBox(
//                   width: 335,
//                   height: 44,
//                   child: OutlinedButton.icon(
//                     icon: const FaIcon(FontAwesomeIcons.google),
//                     label: const Text(
//                       "Sign in with Google",
//                       style: TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF4B5049),
//                       ),
//                     ),
//                     style: OutlinedButton.styleFrom(
//                       side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 const SizedBox(height: 7),
//                 // Apple Sign In
//                 SizedBox(
//                   width: 335,
//                   height: 44,
//                   child: OutlinedButton.icon(
//                     icon: const FaIcon(FontAwesomeIcons.apple),
//                     label: const Text(
//                       "Sign in with Apple",
//                       style: TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF4B5049),
//                       ),
//                     ),
//                     style: OutlinedButton.styleFrom(
//                       side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 // Register link
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Don’t have an account?",
//                       style: TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xFF3B3A35),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "Sign in",
//                         style: TextStyle(
//                           fontFamily: 'Heebo',
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xFF657660),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//




















// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
//
//
// class SignInPage extends StatelessWidget {
//   const SignInPage({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const SignInScreen(),
//     );
//   }
// }
//
// class SignInScreen extends StatelessWidget {
//   const SignInScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Spacer(),
//               // Logo (Image)
//               Container(
//                 width: 48,
//                 height: 70.71,
//                 child: Image.asset('assets/logo_sgin_in.png', fit: BoxFit.contain),
//               ),
//               const SizedBox(height: 20),
//               // "Sign In" text
//               const Text(
//                 "Sign In",
//                 style: TextStyle(
//                   fontFamily: 'Heebo',
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF4B5049),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               // Subtitle text
//               const Text(
//                 "Hi! Welcome back, you’ve been missed",
//                 style: TextStyle(
//                   fontFamily: 'Heebo',
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF646B62),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 30),
//               // Email field
//               TextField(
//                 style: const TextStyle(
//                   fontFamily: 'Heebo',
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF3A3E39),
//                 ),
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   labelStyle: const TextStyle(
//                     fontFamily: 'Heebo',
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF4B5049),
//                   ),
//                   prefixIcon: const Icon(Icons.email_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Password field
//               TextField(
//                 obscureText: true,
//                 style: const TextStyle(
//                   fontFamily: 'Heebo',
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF3A3E39),
//                 ),
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   labelStyle: const TextStyle(
//                     fontFamily: 'Heebo',
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF4B5049),
//                   ),
//                   prefixIcon: const Icon(Icons.lock_outline),
//                   suffixIcon: const Icon(Icons.visibility_off_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const NewPasswordPage(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Forget Password?",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF657660),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Sign In button
//               SizedBox(
//                 width: 335,
//                 height: 44,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF657660),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     "Sign in",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Google Sign In
//               SizedBox(
//                 width: 335,
//                 height: 44,
//                 child: OutlinedButton.icon(
//                   icon: const FaIcon(FontAwesomeIcons.google),
//                   label: const Text(
//                     "Sign in with Google",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF4B5049),
//                     ),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               const SizedBox(height: 10),
//               // Apple Sign In
//               SizedBox(
//                 width: 335,
//                 height: 44,
//                 child: OutlinedButton.icon(
//                   icon: const FaIcon(FontAwesomeIcons.apple),
//                   label: const Text(
//                     "Sign in with Apple",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF4B5049),
//                     ),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Color(0xFFCFD5CE), width: 1),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               const Spacer(),
//               // Register link
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Don’t have an account?",
//                     style: TextStyle(
//                       fontFamily: 'Heebo',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF4F4C43),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       "Sign in",
//                       style: TextStyle(
//                         fontFamily: 'Heebo',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF657660),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NewPasswordPage extends StatelessWidget {
//   const NewPasswordPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("New Password")),
//       body: const Center(
//         child: Text("This is the New Password Page"),
//       ),
//     );
//   }
// }














// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
//
// import 'new_password.dart';
//
// class SignInPage extends StatelessWidget {
//   static const Color primaryColor = Color(0xFF657660);
//
//   const SignInPage({super.key}); // اللون الجديد
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 40), // مسافة بين أعلى الشاشة والصورة
//               // الصورة
//               Container(
//                 width: 48,
//                 height: 70.71,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     'assets/logo_sgin_in.png', // استبدل هذا بالمسار الصحيح للصورة
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10), // مسافة بين الصورة والنص
//               // النص "Sign In"
//               Text(
//                 'Sign In',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'Heebo',
//                 ),
//               ),
//               SizedBox(height: 10), // مسافة بين النصوص
//               Text(
//                 'Hi! Welcome back, you’ve been missed',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: 'Heebo',
//                 ),
//               ),
//               SizedBox(height: 20),
//               // إدخال الإيميل والباسورد
//               Column(
//                 children: [
//                   // Email Label and TextField
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: Text(
//                         'Email',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF4B5049),
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 370,
//                     height: 44,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Color(0xFFA7B2A3), width: 1), // تغيير اللون هنا
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFF101828),
//                           blurRadius: 2,
//                           spreadRadius: 0,
//                           offset: Offset(0, 1),
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                         hintText: 'Mariam sobhy654@gmail.com',
//                         hintStyle: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF3A3E39),
//                           fontWeight: FontWeight.w400,
//                         ),
//                         prefixIcon: Icon(
//                           Icons.email,
//                           size: 20,
//                           color: Color(0xFF3A3E39), // لون الأيقونة
//                         ),
//                         border: InputBorder.none,
//                         alignLabelWithHint: true,
//                       ),
//                       textAlign: TextAlign.center, // جعل النص في المنتصف
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   // Password Label and TextField
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: Text(
//                         'Password',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF4B5049),
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 370,
//                     height: 44,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Color(0xFFA7B2A3), width: 1),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFF101828),
//                           blurRadius: 2,
//                           spreadRadius: 0,
//                           offset: Offset(0, 1),
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                         hintText: '****', // إضافة النجوم بشكل كامل
//                         hintStyle: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF3A3E39),
//                           fontWeight: FontWeight.w400,
//                         ),
//                         border: InputBorder.none,
//                         suffixIcon: Icon(Icons.visibility_off),
//                       ),
//                       textAlign: TextAlign.center, // جعل النص في المنتصف
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               // Forget Password
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => NewPasswordPage()), // التوجيه إلى صفحة NewPasswordPage
//                     );
//                   },
//                   child: Text(
//                     'Forget Password?',
//                     style: TextStyle(
//                       color: primaryColor,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Heebo',
//                     ),
//                   ),
//                 ),
//               ),
//               // زر Sign In
//               Container(
//                 width: 370,
//                 height: 44,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: Text(
//                     'Sign In',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Heebo',
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               // Sign In with Google and Apple
//               Column(
//                 children: [
//                   // Sign in with Google
//                   Container(
//                     width: 370,
//                     height: 44,
//                     child: OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Icon(
//                         FontAwesomeIcons.google,
//                         size: 20,
//                         color: Colors.red,
//                       ),
//                       label: Text(
//                         'Sign in with Google',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Color(0xFFCFD5CE), width: 1), // تغيير اللون هنا
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   // Sign in with Apple
//                   Container(
//                     width: 370,
//                     height: 44,
//                     child: OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Icon(
//                         FontAwesomeIcons.apple,
//                         size: 20,
//                         color: Colors.black,
//                       ),
//                       label: Text(
//                         'Sign in with Apple',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Color(0xFFCFD5CE), width: 1),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Don't have an account
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don't have an account? ",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Heebo',
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'Sign up',
//                       style: TextStyle(
//                         color: primaryColor,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class SignInPage extends StatelessWidget {
//   static const Color primaryColor = Color(0xFF657660); // اللون الجديد
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 40), // مسافة بين أعلى الشاشة والصورة
//               // الصورة
//               Container(
//                 width: 48,
//                 height: 70.71,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     'assets/logo_sgin_in.png', // استبدل هذا بالمسار الصحيح للصورة
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10), // مسافة بين الصورة والنص
//               // النص "Sign In"
//               Text(
//                 'Sign In',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'Heebo',
//                 ),
//               ),
//               SizedBox(height: 10), // مسافة بين النصوص
//               Text(
//                 'Hi! Welcome back, you’ve been missed',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: 'Heebo',
//                 ),
//               ),
//               SizedBox(height: 20),
//               // إدخال الإيميل والباسورد
//               Column(
//                 children: [
//                   Container(
//                     width: 370, // عرض الحاوية
//                     height: 44, // نفس الطول كـ "Sign in with Google"
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8), // الحواف المستديرة
//                       border: Border.all(color: Colors.grey, width: 1), // الحدود
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                         hintText: 'Email',
//                         border: InputBorder.none,
//                       ),
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   Container(
//                     width: 370,
//                     height: 44,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Colors.grey, width: 1),
//                     ),
//                     child: TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                         hintText: 'Password',
//                         border: InputBorder.none,
//                         suffixIcon: Icon(Icons.visibility_off),
//                       ),
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               // Forget Password
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Forget Password?',
//                     style: TextStyle(
//                       color: primaryColor,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Heebo',
//                     ),
//                   ),
//                 ),
//               ),
//               // زر Sign In
//               Container(
//                 width: 370,
//                 height: 44,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: Text(
//                     'Sign In',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Heebo',
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               // Sign In with Google and Apple
//               Column(
//                 children: [
//                   // Sign in with Google
//                   Container(
//                     width: 370,
//                     height: 44,
//                     child: OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Icon(
//                         FontAwesomeIcons.google,
//                         size: 20,
//                         color: Colors.red,
//                       ),
//                       label: Text(
//                         'Sign in with Google',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Colors.black, width: 1),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   // Sign in with Apple
//                   Container(
//                     width: 370,
//                     height: 44,
//                     child: OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Icon(
//                         FontAwesomeIcons.apple,
//                         size: 20,
//                         color: Colors.black,
//                       ),
//                       label: Text(
//                         'Sign in with Apple',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Colors.black, width: 1),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Don't have an account
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don't have an account? ",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Heebo',
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'Sign up',
//                       style: TextStyle(
//                         color: primaryColor,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class SignInPage extends StatelessWidget {
//   static const Color primaryColor = Color(0xFF657660); // اللون الجديد
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: 370, // زيادة عرض الحاوية
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 40,)
//                 // الصورة
//                 Container(
//                   width: 48,
//                   height: 70.71,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       'assets/logo_sgin_in.png', // استبدل هذا بالمسار الصحيح للصورة
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 // جملة Sign In
//                 Text(
//                   'Sign In',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 // جملة Hi! Welcome back
//                 Text(
//                   'Hi! Welcome back, you’ve been missed',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // إدخال الإيميل والباسورد
//                 Column(
//                   children: [
//                     Container(
//                       width: 370, // عرض الحاوية
//                       height: 44, // نفس الطول كـ "Sign in with Google"
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8), // الحواف المستديرة
//                         border: Border.all(color: Colors.grey, width: 1), // الحدود
//                       ),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 12), // لضمان أن النص داخل الحقل يظهر بشكل جيد
//                           hintText: 'Email',
//                           border: InputBorder.none, // إزالة الحدود الافتراضية
//                         ),
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Container(
//                       width: 370,
//                       height: 44,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: Colors.grey, width: 1),
//                       ),
//                       child: TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                           hintText: 'Password',
//                           border: InputBorder.none,
//                           suffixIcon: Icon(Icons.visibility_off),
//                         ),
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 // Forget Password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Forget Password?',
//                       style: TextStyle(
//                         color: primaryColor,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                   ),
//                 ),
//                 // زر Sign In
//                 Container(
//                   width: 370,
//                   height: 44,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: primaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8), // الحواف المستديرة
//                       ),
//                     ),
//                     child: Text(
//                       'Sign In',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 // Sign In with Google and Apple
//                 Column(
//                   children: [
//                     // Sign in with Google
//                     Container(
//                       width: 370,
//                       height: 44,
//                       child: OutlinedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(
//                           FontAwesomeIcons.google,
//                           size: 20,
//                           color: Colors.red,
//                         ),
//                         label: Text(
//                           'Sign in with Google',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Heebo',
//                           ),
//                         ),
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.black, width: 1),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8), // الحواف المستديرة
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     // Sign in with Apple
//                     Container(
//                       width: 370,
//                       height: 44,
//                       child: OutlinedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(
//                           FontAwesomeIcons.apple,
//                           size: 20,
//                           color: Colors.black,
//                         ),
//                         label: Text(
//                           'Sign in with Apple',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Heebo',
//                           ),
//                         ),
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.black, width: 1),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8), // الحواف المستديرة
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 // Don't have an account
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text(
//                         'Sign up',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class SignInPage extends StatelessWidget {
//   static const Color primaryColor = Color(0xFF657660); // اللون الجديد
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: 335, // عرض ثابت
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // الصورة
//                 Container(
//                   width: 48,
//                   height: 70.71,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       'assets/logo_sgin_in.png', // استبدل هذا بالمسار الصحيح للصورة
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // جملة Sign In
//                 Text(
//                   'Sign In',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 // جملة Hi! Welcome back
//                 Text(
//                   'Hi! Welcome back, you’ve been missed',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // إدخال الإيميل والباسورد
//                 Column(
//                   children: [
//                     Container(
//                       width: 335, // عرض ثابت
//                       child: TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           border: OutlineInputBorder(),
//                         ),
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                           height: 1.2,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Container(
//                       width: 335, // عرض ثابت
//                       child: TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           border: OutlineInputBorder(),
//                           suffixIcon: Icon(Icons.visibility_off),
//                         ),
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                           height: 1.2,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 // Forget Password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Forget Password?',
//                       style: TextStyle(
//                         color: primaryColor,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                   ),
//                 ),
//                 // زر Sign In
//                 Container(
//                   width: 335, // عرض ثابت
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: primaryColor,
//                       minimumSize: Size(335, 44), // حجم الزر ثابت
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     ),
//                     child: Text(
//                       'Sign In',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 // Sign In with Google and Apple
//                 Column(
//                   children: [
//                     // Sign in with Google
//                     Container(
//                       width: 335, // عرض ثابت
//                       child: OutlinedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(
//                           FontAwesomeIcons.google,
//                           size: 20,
//                           color: Colors.red,
//                         ),
//                         label: Text(
//                           'Sign in with Google',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Heebo',
//                           ),
//                         ),
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.black, width: 1),
//                           minimumSize: Size(335, 44), // حجم الزر ثابت
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     // Sign in with Apple
//                     Container(
//                       width: 335, // عرض ثابت
//                       child: OutlinedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(
//                           FontAwesomeIcons.apple,
//                           size: 20,
//                           color: Colors.black,
//                         ),
//                         label: Text(
//                           'Sign in with Apple',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Heebo',
//                           ),
//                         ),
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.black, width: 1),
//                           minimumSize: Size(335, 44), // حجم الزر ثابت
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 // Don't have an account
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo',
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text(
//                         'Sign up',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class SignInPage extends StatelessWidget {
//   static const Color primaryColor = Color(0xFF657660); // اللون الجديد
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: screenWidth * 0.9,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // الصورة
//                 Container(
//                   width: 48,
//                   height: 70.71,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       'assets/logo_sgin_in.png', // استبدل هذا بالمسار الصحيح للصورة
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20), // مسافة بين الصورة والنص
//                 // جملة Sign In
//                 Text(
//                   'Sign In',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: 'Heebo', // اسم الخط
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 // جملة Hi! Welcome back
//                 Text(
//                   'Hi! Welcome back, you’ve been missed',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'Heebo', // اسم الخط
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // إدخال الإيميل والباسورد
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                   child: Column(
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           border: OutlineInputBorder(),
//                         ),
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo', // اسم الخط
//                           height: 1.2,
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           border: OutlineInputBorder(),
//                           suffixIcon: Icon(Icons.visibility_off),
//                         ),
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo', // اسم الخط
//                           height: 1.2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 // Forget Password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Forget Password?',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo', // اسم الخط
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // زر Sign In
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(screenWidth * 0.9, 40),
//                       backgroundColor: Colors.transparent,
//                       foregroundColor: primaryColor, // لون النص
//                       elevation: 0, // إزالة الظل
//                       side: BorderSide(color: primaryColor, width: 1), // حواف الزر
//                     ),
//                     child: Text(
//                       'Sign In',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo', // اسم الخط
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 // Sign In with Google and Apple
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                   child: Column(
//                     children: [
//                       // Sign in with Google
//                       OutlinedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(
//                           FontAwesomeIcons.google,
//                           size: 20,
//                           color: Colors.red,
//                         ),
//                         label: Text(
//                           'Sign in with Google',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Heebo', // اسم الخط
//                           ),
//                         ),
//                         style: OutlinedButton.styleFrom(
//                           minimumSize: Size(screenWidth * 0.9, 40),
//                           side: BorderSide(color: Colors.black, width: 1),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       // Sign in with Apple
//                       OutlinedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(
//                           FontAwesomeIcons.apple,
//                           size: 20,
//                           color: Colors.black,
//                         ),
//                         label: Text(
//                           'Sign in with Apple',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Heebo', // اسم الخط
//                           ),
//                         ),
//                         style: OutlinedButton.styleFrom(
//                           minimumSize: Size(screenWidth * 0.9, 40),
//                           side: BorderSide(color: Colors.black, width: 1),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Don't have an account
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Heebo', // اسم الخط
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text(
//                         'Sign up',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Heebo', // اسم الخط
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // استيراد مكتبة flutter_svg
//
// class SignInPage extends StatelessWidget {
//   static const Color primaryColor = Colors.green;
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: screenWidth * 0.9,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // الصورة
//                 Container(
//                   width: 48,
//                   height: 70.71,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey, width: 1),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       'assets/logo_sgin_in.png', // استبدل هذا بالمسار الصحيح للصورة
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20), // مسافة بين الصورة والنص
//                 // جملة Sign In
//                 Text(
//                   'Sign In',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 // جملة Hi! Welcome back
//                 Text(
//                   'Hi! Welcome back, you’ve been missed',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 14),
//                 ),
//                 SizedBox(height: 20),
//                 // إدخال الإيميل والباسورد
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: (screenWidth - 335) / 2),
//                   child: Column(
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           border: OutlineInputBorder(),
//                         ),
//                         style: TextStyle(height: 1.2),
//                       ),
//                       SizedBox(height: 20),
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           border: OutlineInputBorder(),
//                           suffixIcon: Icon(Icons.visibility_off),
//                         ),
//                         style: TextStyle(height: 1.2),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 // Forget Password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: (screenWidth - 335) / 2),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Forget Password?',
//                         style: TextStyle(color: primaryColor),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // زر Sign In
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: (screenWidth - 335) / 2),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(335, 44),
//                       backgroundColor: primaryColor,
//                     ),
//                     child: Text('Sign In',style: TextStyle(
//                       color: Colors.white
//                     ),),
//                   ),
//                 ),
//                 SizedBox(height: 15), // تقليل المسافة بين الزر والنص
//                 // Sign In with Google and Apple
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: (screenWidth - 335) / 2),
//                   child: Column(
//                     children: [
//                       // Sign in with Google
//                       OutlinedButton.icon(
//
//                       onPressed: () {},
//                   icon: Icon(
//                     FontAwesomeIcons.google,
//                     size: 20,
//                     color: Colors.red,
//                   ),
//                   label: Text('Sign in with Google', style: TextStyle(
//                     color: Colors.black
//                   ),),
//                         style: OutlinedButton.styleFrom(
//                           minimumSize: Size(335, 44),
//                           side: BorderSide(color: Colors.black, width: 1),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       // Sign in with Apple
//                       OutlinedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(
//                           FontAwesomeIcons.apple,
//                           size: 20, // Icon size
//                           color: Colors.black, // Icon color
//                         ),
//                          label: Text('Sign in with Apple',style: TextStyle(
//                            color: Colors.black
//                          ),),
//                         style: OutlinedButton.styleFrom(
//                           minimumSize: Size(335, 44),
//                           side: BorderSide(color: Colors.black, width: 1),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Don't have an account
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Don't have an account? "),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text(
//                         'Sign up',
//                         style: TextStyle(color: primaryColor),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
//
// class SignInPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: screenWidth * 0.9, // العرض 90% من الشاشة
//           height: screenHeight * 0.8, // الطول 80% من الشاشة
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // الصورة
//               Image.asset(
//                 'assets/logo_sgin_in.png', // استبدل هذا بالمسار الصحيح للصورة
//                 width: screenWidth * 0.12, // نفس الأبعاد السابقة
//                 height: screenWidth * 0.12, // نفس الأبعاد السابقة
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // جملة Sign In
//               Text(
//                 'Sign In',
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.06, // حجم الخط نسبي
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               // جملة Hi! Welcome back
//               Text(
//                 'Hi! Welcome back, you’ve been missed',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: screenWidth * 0.035),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // إدخال الإيميل والباسورد
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(),
//                         suffixIcon: Icon(Icons.visibility_off),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               // Forget Password
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Forget Password?',
//                   style: TextStyle(color: Colors.green),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // زر Sign In
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity, screenHeight * 0.06),
//                     backgroundColor: Colors.green,
//                   ),
//                   child: Text('Sign In'),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // Sign In with Google and Apple
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                 child: Column(
//                   children: [
//                     OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Icon(Icons.g_translate, color: Colors.red),
//                       label: Text('Sign in with Google'),
//                       style: OutlinedButton.styleFrom(
//                         minimumSize: Size(double.infinity, screenHeight * 0.06),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Icon(Icons.apple, color: Colors.black),
//                       label: Text('Sign in with Apple'),
//                       style: OutlinedButton.styleFrom(
//                         minimumSize: Size(double.infinity, screenHeight * 0.06),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // Don't have an account
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Don't have an account? "),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'Sign in',
//                       style: TextStyle(color: Colors.green),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: SignInPage(),
//   ));
// }




// import 'package:flutter/material.dart';
//
// class SignInPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: screenWidth * 0.9, // العرض 90% من الشاشة
//           height: screenHeight * 0.8, // الطول 80% من الشاشة
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // الصورة
//               Icon(
//                 Icons.home, // استبدل هذا بالـ SVG أو الأيقونة المناسبة
//                 size: screenWidth * 0.12, // حجم الصورة نسبي
//                 color: Colors.green,
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // جملة Sign In
//               Text(
//                 'Sign In',
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.06, // حجم الخط نسبي
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               // جملة Hi! Welcome back
//               Text(
//                 'Hi! Welcome back, you’ve been missed',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: screenWidth * 0.035),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // إدخال الإيميل والباسورد
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(),
//                         suffixIcon: Icon(Icons.email_outlined),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(),
//                         suffixIcon: Icon(Icons.visibility_off),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               // Forget Password
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Forget Password?',
//                   style: TextStyle(color: Colors.green),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // زر Sign In
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity, screenHeight * 0.06),
//                     backgroundColor: Colors.green,
//                   ),
//                   child: Text('Sign In'),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // Sign In with Google and Apple
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                 child: Column(
//                   children: [
//                     OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Icon(Icons.g_translate, color: Colors.red),
//                       label: Text('Sign in with Google'),
//                       style: OutlinedButton.styleFrom(
//                         minimumSize: Size(double.infinity, screenHeight * 0.06),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Icon(Icons.apple, color: Colors.black),
//                       label: Text('Sign in with Apple'),
//                       style: OutlinedButton.styleFrom(
//                         minimumSize: Size(double.infinity, screenHeight * 0.06),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // Don't have an account
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Don't have an account? "),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'Sign in',
//                       style: TextStyle(color: Colors.green),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: SignInPage(),
//   ));
// }