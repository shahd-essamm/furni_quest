import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeFunction {
 static void scan() async {
    try {
      String code = await FlutterBarcodeScanner.scanBarcode(
          '#2A99CF', 'cancel', true, ScanMode.QR);
          print('code is$code');
    } catch (e) {
      print(e);
    }
  }
  static Widget showCode(){
    return Column(mainAxisSize: MainAxisSize.min,children: [
       BarcodeWidget(
        color: Colors.black,
          barcode: Barcode.qrCode(), 
          data: '123456', 
          width: 200,
          height: 200,
        ),

    ],);
  }
}
