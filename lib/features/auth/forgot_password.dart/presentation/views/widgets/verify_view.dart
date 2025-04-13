import 'package:flutter/material.dart';
import 'package:furni_quest/features/auth/forgot_password.dart/presentation/views/widgets/new_pass_view.dart';
import 'package:furni_quest/features/auth/signin/presentation/views/signin_view.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key, required this.isNewPassword});

  final bool isNewPassword;

  static const String routeName = 'verify_view';

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final TextEditingController _codeController = TextEditingController();
  bool isCodeWrong = false; // t or f
  bool isCodeVerified = false; // verify code
  bool isCodeComplete = false;

  void verifyCode() {
    if (_codeController.text == "1234") {
      // true code
      setState(() {
        isCodeWrong = false;
        isCodeVerified = true;
      });

      widget.isNewPassword
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewPasswordView(),
              ))
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInView(),
              ));
    } else {
      setState(() {
        isCodeWrong = true; // false code
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          false, // يمنع تغيير ارتفاع الشاشة عند ظهور الكيبورد
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF3A3E39)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context)
              .unfocus(), // إغلاق الكيبورد عند النقر خارج الإدخال
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                .onDrag, // إخفاء الكيبورد بالسحب
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 36),
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
                    "Please enter the code we just sent to email\nMariamsobhy@gmail.com ",
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
                            color: isCodeWrong
                                ? Color(0xFFD73F2C)
                                : Color(0xFFC3C9C0),
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
                            counterText: "",
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }

                            setState(() {
                              List<String> currentCode =
                                  _codeController.text.split('');
                              if (currentCode.length < 4) {
                                currentCode = List.generate(
                                    4,
                                    (i) => i < currentCode.length
                                        ? currentCode[i]
                                        : "");
                              }
                              currentCode[index] = value;
                              _codeController.text = currentCode.join();

                              // ✅ نتحقق هل الكود مكون من 4 أرقام
                              isCodeComplete = _codeController.text.length == 4;
                            });
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 32),
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
                      // resend code
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
                  SizedBox(height: 24),
                  if (isCodeVerified)
                    Text(
                      "Code Verified Successfully!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF53634F),
                      ),
                    ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: 335,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCodeComplete
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
                          color:
                              isCodeComplete ? Colors.white : Color(0xFF889584),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                      height: MediaQuery.of(context)
                          .viewInsets
                          .bottom), // يجعل الزر مرئيًا عند ظهور الكيبورد
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
