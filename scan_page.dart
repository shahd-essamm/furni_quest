
import 'package:flutter/material.dart';
import 'package:furni_quest/screens/Scan_Screens/qr_function.dart';

class ScannScreen extends StatefulWidget {
  const ScannScreen({super.key});

  @override
  State<ScannScreen> createState() => _ScannScreenState();
}

class _ScannScreenState extends State<ScannScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    QrCodeFunction.scan();
                  },
                  child: const Text(
                    'Scan Qr Code',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  )),const SizedBox(height: 100,),
                  ElevatedButton(
                  onPressed: () {dialog();},
                  child: const Text(
                    'Show Qr Code',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  dialog(){
    showDialog(
       builder: (context)=> AlertDialog(content: QrCodeFunction.showCode()),
    context: context);
  }
}
