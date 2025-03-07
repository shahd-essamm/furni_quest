import 'package:flutter/material.dart';
import 'package:furni_quest/screens/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration (seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> OnBoarding()));
    });
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
                child: Image.asset("assets/Logo.png", height: 153, width: 154,),
              ),
          ),
        ],
      ),
    );
  }
}
