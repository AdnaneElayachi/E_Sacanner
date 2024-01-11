// import 'package:flutter/material.dart';
// import 'package:tesseract_ocr/tesseract_ocr.dart';
// import 'dart:typed_data';
// import 'dart:io';
// import 'package:flutter/services.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   ByteData data = await rootBundle.load('assets/tessdata/eng.traineddata');
//   List<int> bytes = data.buffer.asUint8List();
//   final directory = await getApplicationDocumentsDirectory();
//   final path = '${directory.path}/eng.traineddata';
//   File(path).writeAsBytes(bytes, flush: true);

//   runApp(MyHomePage());
// }
