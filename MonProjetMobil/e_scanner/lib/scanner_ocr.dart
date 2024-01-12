import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data = await rootBundle.load('assets/tessdata/eng.traineddata');
  List<int> bytes = data.buffer.asUint8List();
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/eng.traineddata';
  File(path).writeAsBytes(bytes, flush: true);

  runApp(const MyApp());
}

getApplicationDocumentsDirectory() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Your home page widget code here
    return Container();
  }
}
