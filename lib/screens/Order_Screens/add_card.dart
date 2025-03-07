import 'package:flutter/material.dart';
import 'package:furni_quest/screens/Order_Screens/verify_number.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:flutter/services.dart';

class AddCardScreen extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool isCardSaved = false;
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;

      setState(() {
        image = File(pickedImage.path); // حفظ الصورة بدون عرضها
      });
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF3A3E39)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Add Card",
          style: TextStyle(
            fontFamily: 'Heebo',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3A3E39),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: KeyboardAvoider(
        autoScroll: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 340,
                  height: 205,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/order_image/Visa card.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28),
              buildInputField("Card holder name", "Mariam Sobhy"),
              SizedBox(height: 16),
              buildInputField("Card Number", "2565 6262 3632 3266"),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: buildInputField("Expiry Date", "01/30")),
                  SizedBox(width: 21),
                  Expanded(child: buildInputField("CVV", "217")),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: isCardSaved,
                    onChanged: (value) {
                      setState(() {
                        isCardSaved = value!;
                      });
                    },
                    activeColor: Color(0xFF657660),
                    checkColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Text(
                    "Save your card information",
                    style: TextStyle(
                      fontFamily: 'Heebo',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3A3E39),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 90),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      pickImage(ImageSource.camera);
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFF96A093)),
                      ),
                      child: Icon(Icons.qr_code_scanner, size: 24, color: Color(0xFF657660)),
                    ),
                  ),
                  SizedBox(width: 35),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyNumber()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF53634F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(280, 44),
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Heebo',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4B5049),
          ),
        ),
        SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: 'Heebo',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFFC3C9C0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFC3C9C0)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFC3C9C0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF4B5049)),
            ),
          ),
        ),
      ],
    );
  }
}