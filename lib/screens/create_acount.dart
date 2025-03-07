import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'create_bus_acount.dart';
import 'sign_in_screen.dart';
import 'verify_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 90),
              const Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3A3E39),
                    fontFamily: 'Heebo',
                  ),
                ),
              ),
              const SizedBox(height: 3),
              const Center(
                child: Text(
                  'Fill your information below',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF646B62),
                    fontFamily: 'Heebo',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              _buildInputField("Name", "Mariam Sobhy", false),
              const SizedBox(height: 16),
              _buildInputField("Email", "Mariam.sobhy@gmail.com", true),
              const SizedBox(height: 16),
              _buildInputField("Password", "2868686868", false, isPassword: true),
              const SizedBox(height: 6),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    activeColor: const Color(0xFF53634F),
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'Agree with ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A3E39),
                        fontFamily: 'Heebo',
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms & Condition',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF515E4D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFC3C9C0)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: const Text(
                    'For Business Account',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3A3E39),
                      fontFamily: 'Heebo',
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateBusinessAccountScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isChecked
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyScreen(),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 44),
                  backgroundColor: const Color(0xFF53634F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Create account',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Heebo',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () {
                  // إجراء عند النقر على Sign up with Google
                },
                icon: const Icon(
                  FontAwesomeIcons.google,
                  size: 20,
                  color: Colors.red,
                ),
                label: const Text(
                  'Sign up with Google',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4B5049),
                    fontFamily: 'Heebo',
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 44),
                  side: const BorderSide(color: Color(0xFFC3C9C0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3B3A35),
                      fontFamily: 'Heebo',
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF657660),
                          fontFamily: 'Heebo',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, bool hasIcon,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4B5049),
            fontFamily: 'Heebo',
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFC3C9C0)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A101828),
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              prefixIcon: hasIcon ? const Icon(Icons.email) : null,
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFFC3C9C0),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}






//نفس الكود بس responsive
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'create_bus_acount.dart';
// import 'sign_in_screen.dart';
// import 'verify_screen.dart';
//
// class CreateAccountScreen extends StatefulWidget {
//   const CreateAccountScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CreateAccountScreen> createState() => _CreateAccountScreenState();
// }
//
// class _CreateAccountScreenState extends State<CreateAccountScreen> {
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     // استخدم MediaQuery للحصول على أبعاد الشاشة
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06), // 6% من عرض الشاشة
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: screenHeight * 0.1), // 10% من ارتفاع الشاشة
//               const Center(
//                 child: Text(
//                   'Create Account',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF3A3E39),
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01), // 1% من ارتفاع الشاشة
//               const Center(
//                 child: Text(
//                   'Fill your information below',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF646B62),
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.04), // 4% من ارتفاع الشاشة
//               _buildInputField("Name", "Mariam Sobhy", false),
//               SizedBox(height: screenHeight * 0.02), // 2% من ارتفاع الشاشة
//               _buildInputField("Email", "Mariam.sobhy@gmail.com", true),
//               SizedBox(height: screenHeight * 0.02),
//               _buildInputField("Password", "2868686868", false, isPassword: true),
//               SizedBox(height: screenHeight * 0.02),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: isChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         isChecked = value ?? false;
//                       });
//                     },
//                     activeColor: const Color(0xFF53634F),
//                   ),
//                   RichText(
//                     text: const TextSpan(
//                       text: 'Agree with ',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF3A3E39),
//                         fontFamily: 'Heebo',
//                       ),
//                       children: [
//                         TextSpan(
//                           text: 'Terms & Condition',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFF515E4D),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: screenHeight * 0.01), // 1% من ارتفاع الشاشة
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: const Color(0xFFC3C9C0)),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: ListTile(
//                   title: const Text(
//                     'For Business Account',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF3A3E39),
//                       fontFamily: 'Heebo',
//                     ),
//                   ),
//                   trailing: const Icon(Icons.arrow_forward),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CreateBusinessAccountScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.03), // 3% من ارتفاع الشاشة
//               ElevatedButton(
//                 onPressed: isChecked
//                     ? () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => VerifyScreen(),
//                     ),
//                   );
//                 }
//                     : null,
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, screenHeight * 0.06), // 6% من ارتفاع الشاشة
//                   backgroundColor: const Color(0xFF53634F),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Create account',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               OutlinedButton.icon(
//                 onPressed: () {
//                   // إجراء عند النقر على Sign up with Google
//                 },
//                 icon: const Icon(
//                   FontAwesomeIcons.google,
//                   size: 20,
//                   color: Colors.red,
//                 ),
//                 label: const Text(
//                   'Sign up with Google',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF4B5049),
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//                 style: OutlinedButton.styleFrom(
//                   minimumSize: Size(double.infinity, screenHeight * 0.06),
//                   side: const BorderSide(color: Color(0xFFC3C9C0)),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.03),
//               Center(
//                 child: Text.rich(
//                   TextSpan(
//                     text: 'Already have an account? ',
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF3B3A35),
//                       fontFamily: 'Heebo',
//                     ),
//                     children: [
//                       TextSpan(
//                         text: 'Sign in',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xFF657660),
//                           fontFamily: 'Heebo',
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => SignInPage(),
//                               ),
//                             );
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInputField(String label, String hint, bool hasIcon,
//       {bool isPassword = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: Color(0xFF4B5049),
//             fontFamily: 'Heebo',
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: const Color(0xFFC3C9C0)),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0x1A101828),
//                 offset: Offset(0, 1),
//                 blurRadius: 2,
//               ),
//             ],
//           ),
//           child: TextField(
//             obscureText: isPassword,
//             decoration: InputDecoration(
//               prefixIcon: hasIcon ? const Icon(Icons.email) : null,
//               hintText: hint,
//               hintStyle: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFFC3C9C0),
//               ),
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(horizontal: 12),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }






















// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:furni_quest/screens/create_bus_acount.dart';
// import 'package:furni_quest/screens/sign_in_screen.dart';
// import 'verify_screen.dart';
// // import 'package:furni_quest/screens/verify_screen.dart';
//
// class CreateAccountScreen extends StatefulWidget {
//   const CreateAccountScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CreateAccountScreen> createState() => _CreateAccountScreenState();
// }
//
// class _CreateAccountScreenState extends State<CreateAccountScreen> {
//   bool isChecked = false; // لإدارة حالة الـ Checkbox
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 50),
//               const Text(
//                 'Create Account',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Fill your information below',
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   hintText: 'Mariam Sobhy',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'Mariam.sobhy@gmail.com',
//                   prefixIcon: const Icon(Icons.email),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   hintText: '****',
//                   suffixIcon: const Icon(Icons.visibility_off),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: isChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         isChecked = value ?? false;
//                       });
//                     },
//                   ),
//                   const Text('Agree with '),
//                   GestureDetector(
//                     onTap: () {
//                       // إجراء عند النقر على "Terms & Condition"
//                     },
//                     child: const Text(
//                       'Terms & Condition',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: ListTile(
//                   title: const Text('For Business Account'),
//                   trailing: const Icon(Icons.arrow_forward),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CreateBusinessAccountScreen(),),
//
//                     );
//                     // إجراء عند النقر على Business Account
//                   },
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: isChecked
//                     ? () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => VerifyScreen(),
//                     ),
//                   );
//                 }
//                     : null,
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   backgroundColor: Colors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text('Create account'),
//               ),
//               const SizedBox(height: 16),
//               OutlinedButton.icon(
//                 onPressed: () {
//                   // إجراء عند النقر على Sign up with Google
//                 },
//                 icon:  Icon(
//                     FontAwesomeIcons.google,
//                     size: 20,
//                     color: Colors.red, // يمكنك وضع أيقونة Google الحقيقية هنا
//                 ),
//                 label: const Text('Sign up with Google'),
//                 style: OutlinedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   side: const BorderSide(color: Colors.black),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Center(
//                 child: Text.rich(
//                   TextSpan(
//                     text: 'Already have an account? ',
//                     style: const TextStyle(color: Colors.black),
//                     children: [
//                       TextSpan(
//                         text: 'Sign in',
//                         style: const TextStyle(color: Colors.blue),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => SignInPage(),
//                               ),
//                             );
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// شاشة VerifyScreen
// class VerifyScreen extends StatelessWidget {
//   const VerifyScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Verify Account"),
//       ),
//       body: Center(
//         child: const Text(
//           'This is the Verify Screen',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

// شاشة SignInPage
// class SignInPage extends StatelessWidget {
//   const SignInPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sign In"),
//       ),
//       body: Center(
//         child: const Text(
//           'Welcome to the Sign In Page',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// class CreateAccountScreen extends StatefulWidget {
//   const CreateAccountScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CreateAccountScreen> createState() => _CreateAccountScreenState();
// }
//
// class _CreateAccountScreenState extends State<CreateAccountScreen> {
//   bool isChecked = false; // لإدارة حالة الـ Checkbox
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 50),
//               const Text(
//                 'Create Account',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Fill your information below',
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 24),
//               const TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   hintText: 'Mariam Sobhy',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'Mariam.sobhy@gmail.com',
//                   prefixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   hintText: '****',
//                   suffixIcon: Icon(Icons.visibility_off),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: isChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         isChecked = value ?? false;
//                       });
//                     },
//                   ),
//                   const Text('Agree with '),
//                   GestureDetector(
//                     onTap: () {
//                       // إضافة إجراء عند النقر على "Terms & Condition"
//                     },
//                     child: const Text(
//                       'Terms & Condition',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               ListTile(
//                 title: const Text('For Business Account'),
//                 trailing: const Icon(Icons.arrow_forward),
//                 onTap: () {
//                   // إجراء عند النقر على Business Account
//                 },
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: isChecked
//                     ? () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const VerifyScreen(),
//                     ),
//                   );
//                 }
//                     : null, // تعطيل الزر إذا لم يتم تحديد الـ Checkbox
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   backgroundColor: Colors.green,
//                 ),
//                 child: const Text('Create account'),
//               ),
//               const SizedBox(height: 16),
//               OutlinedButton.icon(
//                 onPressed: () {
//                   // إجراء عند النقر على Sign up with Google
//                 },
//                 icon: const Icon(
//                   Icons.account_circle, // يمكنك وضع أيقونة Google الحقيقية هنا
//                   size: 20,
//                 ),
//                 label: const Text('Sign up with Google'),
//                 style: OutlinedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Center(
//                 child: Text.rich(
//                   TextSpan(
//                     text: 'Already have an account? ',
//                     style: const TextStyle(color: Colors.black),
//                     children: [
//                       TextSpan(
//                         text: 'Sign in',
//                         style: const TextStyle(color: Colors.blue),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SignInPage(),
//                               ),
//                             );
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // شاشة VerifyScreen
// class VerifyScreen extends StatelessWidget {
//   const VerifyScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Verify Account"),
//       ),
//       body: Center(
//         child: const Text(
//           'This is the Verify Screen',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
//
// // شاشة SignInPage
// class SignInPage extends StatelessWidget {
//   const SignInPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sign In"),
//       ),
//       body: Center(
//         child: const Text(
//           'Welcome to the Sign In Page',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// class loginPage extends StatelessWidget {
//   const loginPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           body: Column(
//             children: [],
//           ),
//         ));
//   }
//}
// import 'package:flutter/material.dart';
// import 'package:flutter_font_icons/flutter_font_icons.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:furni_quest/craete_acount.dart';
// import 'package:furni_quest/screens/verify_screen.dart';
//
//
// class CreateAccountScreen extends StatelessWidget {
//   const CreateAccountScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Create Account',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Fill your information below',
//               style: TextStyle(color: Colors.grey),
//             ),
//             SizedBox(height: 24),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 hintText: 'Mariam Sobhy',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 hintText: 'Mariam sobhy@gmail.com',
//                 prefixIcon: Icon(Icons.email),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 hintText: '286868686868',
//                 suffixIcon: Icon(Icons.visibility_off),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Checkbox(value: false, onChanged: (value) {}),
//                 Text('Agree with '),
//                 Text(
//                   'Terms & Condition',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             ListTile(
//               title: Text('For Business Account'),
//               trailing: Icon(Icons.arrow_forward),
//               onTap: () {},
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyScreen()));
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//                 primary: Colors.green, // لون الخلفية
//               ),
//               child: Text('Create account'),
//             ),
//             SizedBox(height: 16),
//             OutlinedButton.icon(
//               onPressed: () {},
//               icon: Icon(
//                   FontAwesomeIcons.google,
//               size:20
//               ),
//               // icon: Image.asset(
//               //   'assets/google_logo.png',
//               //   width: 24,
//               //   height: 24,
//               // ),
//               label: Text('Sign up with Google'),
//               style: OutlinedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//               ),
//             ),
//             SizedBox(height: 16),
//             Center(
//               child: Text.rich(
//                 TextSpan(
//                   text: 'Already have an account? ',
//                   children: [
//                     TextSpan(
//                       text: 'Sign in',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
