import 'package:flutter/material.dart';
import 'package:furni_quest/screens/Order_Screens/verify_code_number.dart';


class VerifyNumber extends StatefulWidget {
  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  TextEditingController _controller = TextEditingController();
  Color _borderColor = Color(0xFFC3C9C0);
  Color _buttonColor = Color(0xFFE5E8E3);
  Color _buttonTextColor = Color(0xFF889584);
  Color _textColor = Color(0xFFC3C9C0);

  void _onTextChanged(String value) {
    setState(() {
      if (value.isNotEmpty) {
        _borderColor = Color(0xFF868E82);
        _buttonColor = Color(0xFF53634F);
        _buttonTextColor = Colors.white;
        _textColor = Color(0xFF3A3E39);
      } else {
        _borderColor = Color(0xFFC3C9C0);
        _buttonColor = Color(0xFFE5E8E3);
        _buttonTextColor = Color(0xFF889584);
        _textColor = Color(0xFFC3C9C0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 36,),
              Text(
                "Verify your phone number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Heebo',
                  color: Color(0xFF3A3E39),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We will send you a confirmation code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Heebo',
                  color: Color(0xFF646B62),
                ),
              ),
              SizedBox(height: 28),
              Container(
                width: 335,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: _borderColor),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1A101828),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Text(
                            "Eg",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Heebo',
                              color: Color(0xFF3A3E39),
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: Color(0xFF3A3E39)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "+1 (578) 000-00000",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Heebo',
                            color: _textColor,
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: _onTextChanged,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 335,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: _buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyCodeNumber()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Heebo',
                      color: _buttonTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}