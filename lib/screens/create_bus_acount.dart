import 'package:flutter/material.dart';
import 'package:furni_quest/screens/create_acount.dart';
import 'package:furni_quest/screens/verify_screen.dart';



class CreateBusinessAccountScreen extends StatefulWidget {
  const CreateBusinessAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateBusinessAccountScreen> createState() => _CreateBusinessAccountScreenState();
}

class _CreateBusinessAccountScreenState extends State<CreateBusinessAccountScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateAccountScreen(),)
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Create Business Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3A3E39),
                    fontFamily: 'Heebo',
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Fill your information below',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4B5049),
                    fontFamily: 'Heebo',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildInputField(label: 'Brand Name'),
              _buildInputField(
                label: 'Brand Email',
                icon: Icons.email_outlined,
                iconPosition: IconPosition.left,
              ),
              _buildInputField(label: 'Phone Number', prefixText: 'Eg'),
              _buildInputField(label: 'Company Address'),
              _buildInputField(
                label: 'Brand Document',
                icon: Icons.attach_file_outlined,
                iconPosition: IconPosition.right,
              ),
              _buildInputField(
                label: 'Password',
                isPassword: true,
                hintText: '****',
                icon: Icons.visibility_outlined,
              ),
              _buildInputField(
                label: 'Confirm Password',
                isPassword: true,
                hintText: '****',
                icon: Icons.visibility_outlined,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  // _buildCheckBox(
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    activeColor: const Color(0xFF53634F),
                  ),
                  // ),
                  const SizedBox(width: 10),
                  const Text(
                    'Agree with Terms & Condition',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF515E4D),
                      fontFamily: 'Heebo',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  // _buildCheckBox(
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    activeColor: const Color(0xFF53634F),
                  ),
                  // ),
                  const SizedBox(width: 10),
                  const Text(
                    'Agree to The Privacy Policy',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF515E4D),
                      fontFamily: 'Heebo',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: isChecked?
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  VerifyScreen(),
                      ),
                    );
                  } : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(335, 44),
                    backgroundColor: const Color(0xFF657660),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Heebo',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    IconData? icon,
    String? prefixText,
    bool isPassword = false,
    String? hintText,
    IconPosition iconPosition = IconPosition.right,
  }) {
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
          width: 335,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFC3C9C0), width: 1),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A101828),
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              if (icon != null && iconPosition == IconPosition.left)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(icon, color: Color(0xFFC3C9C0)),
                ),
              if (prefixText != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    prefixText,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4B5049),
                      fontFamily: 'Heebo',
                    ),
                  ),
                ),
              Expanded(
                child: TextField(
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    hintText: hintText ?? label,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFC3C9C0),
                      fontFamily: 'Heebo',
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
              if (icon != null && iconPosition == IconPosition.right)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(icon, color: Color(0xFFC3C9C0)),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCheckBox() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF515E4D), width: 1),
      ),
    );
  }
}

enum IconPosition { left, right }






// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
//
// class CreateBusinessAccountScreen extends StatefulWidget {
//   const CreateBusinessAccountScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CreateBusinessAccountScreen> createState() => _CreateBusinessAccountScreenState();
// }
//
// class _CreateBusinessAccountScreenState extends State<CreateBusinessAccountScreen> {
//   String? selectedDocument;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             size: 24,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               const Center(
//                 child: Text(
//                   'Create Business Account',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF3A3E39),
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Center(
//                 child: Text(
//                   'Fill your information below',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF4B5049),
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               _buildInputField(label: 'Brand Name'),
//               _buildInputField(label: 'Brand Email', icon: Icons.email_outlined),
//               _buildInputField(label: 'Phone Number', prefixText: 'Eg'),
//               _buildInputField(label: 'Company Address'),
//               _buildDocumentInputField(), // تعديل الحقل الخاص بالمستندات
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDocumentInputField() {
//     return GestureDetector(
//       onTap: () async {
//         // استخدام File Picker لتحديد الملف
//         FilePickerResult? result = await FilePicker.platform.pickFiles();
//         if (result != null) {
//           setState(() {
//             selectedDocument = result.files.single.name;
//           });
//         }
//       },
//       child: Container(
//         width: 335,
//         height: selectedDocument == null ? 44 : 105,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: const Color(0xFFC3C9C0), width: 1),
//           color: Colors.white,
//         ),
//         child: selectedDocument == null
//             ? Row(
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Icon(Icons.attach_file_outlined, color: Color(0xFFC3C9C0)),
//             ),
//             const Text(
//               'Brand Document',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFFC3C9C0),
//                 fontFamily: 'Heebo',
//               ),
//             ),
//           ],
//         )
//             : Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Document Selected:',
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF4B5049),
//                   fontFamily: 'Heebo',
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 selectedDocument!,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF4B5049),
//                   fontFamily: 'Heebo',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInputField({
//     required String label,
//     IconData? icon,
//     String? prefixText,
//     bool isPassword = false,
//   }) {
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
//           width: 335,
//           height: 44,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: const Color(0xFFC3C9C0), width: 1),
//             color: Colors.white,
//           ),
//           child: Row(
//             children: [
//               if (prefixText != null)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     prefixText,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF4B5049),
//                       fontFamily: 'Heebo',
//                     ),
//                   ),
//                 ),
//               Expanded(
//                 child: TextField(
//                   obscureText: isPassword,
//                   decoration: InputDecoration(
//                     hintText: label,
//                     border: InputBorder.none,
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                   ),
//                 ),
//               ),
//               if (icon != null)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Icon(icon, color: Color(0xFFC3C9C0)),
//                 ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }




// import 'package:flutter/material.dart';
//
// class CreateBusinessAccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, size: 24, color: Colors.black),
//           onPressed: () {
//             Navigator.pushNamed(context, '/CreateAccountScreen');
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             Text(
//               'Create Business Account',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF3A3E39),
//                 fontFamily: 'Heebo',
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Fill your information below',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Color(0xFF646B62),
//                 fontFamily: 'Heebo',
//               ),
//             ),
//             const SizedBox(height: 24),
//             ..._buildFormFields(),
//             const SizedBox(height: 16),
//             _buildCheckBox('Agree with Terms & Condition'),
//             const SizedBox(height: 8),
//             _buildCheckBox('Agree to The Privacy Policy'),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               height: 44,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF53634F),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   shadowColor: Colors.black,
//                   elevation: 5,
//                 ),
//                 onPressed: () {
//                   // Action for Sign In
//                 },
//                 child: Text(
//                   'Sign in',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildFormFields() {
//     final fields = [
//       'Brand Name',
//       'Brand Email',
//       'Phone Number',
//       'Company Address',
//       'Brand Document',
//       'Password',
//       'Confirm Password',
//     ];
//
//     return fields.map((field) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               field,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Color(0xFF4B5049),
//                 fontFamily: 'Heebo',
//               ),
//             ),
//             const SizedBox(height: 8),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Color(0xFFC3C9C0), width: 1),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0x101828).withOpacity(0.1),
//                     offset: Offset(0, 1),
//                     blurRadius: 2,
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 obscureText: field.contains('Password'),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//                   hintText: field == 'Phone Number' ? '+1 (XXX) XXX-XXXX' : '',
//                   hintStyle: TextStyle(
//                     color: Color(0xFFC3C9C0),
//                     fontFamily: 'Heebo',
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }).toList();
//   }
//
//   Widget _buildCheckBox(String label) {
//     return Row(
//       children: [
//         Container(
//           width: 16,
//           height: 16,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(4),
//             border: Border.all(color: Color(0xFF515E4D), width: 1),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF515E4D),
//             fontFamily: 'Heebo',
//           ),
//         ),
//       ],
//     );
//   }
// }