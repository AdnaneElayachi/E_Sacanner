// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController urlController = TextEditingController();
//   String fetchedData = '';
//   bool isLoading = false;
//   final ImagePicker _picker = ImagePicker();

//   Future<void> pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         urlController.text = pickedFile.path;
//       });
//     }
//   }

//   Future<void> fetchData() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final response = await http.get(Uri.parse(urlController.text));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           fetchedData = data.toString();
//         });
//       } else {
//         setState(() {
//           fetchedData =
//               'Erreur ${response.statusCode}: ${response.reasonPhrase}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         fetchedData = 'Erreur de connexion';
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('E-Scanner'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: pickImage,
//               child: Text('Sélectionner une image'),
//             ),
//             SizedBox(height: 20),
//             if (urlController.text.isNotEmpty)
//               Image.network(urlController.text), // Use the URL directly
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: isLoading ? null : fetchData,
//               child: Text('Charger l\'image'),
//             ),
//             SizedBox(height: 20),
//             if (isLoading)
//               CircularProgressIndicator()
//             else
//               Text(
//                 'Données récupérées : $fetchedData',
//                 style: TextStyle(fontSize: 16),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // 11111111111111111111
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tesseract OCR Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool _scanning = false;
//   String _extractText = '';
//   File? _pickedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.green,
//         title: Text('Tesseract OCR'),
//       ),
//       body: ListView(
//         children: [
//           _pickedImage == null
//               ? Container(
//                   height: 300,
//                   color: Colors.grey[300],
//                   child: Icon(
//                     Icons.image,
//                     size: 100,
//                   ),
//                 )
//               : Container(
//                   height: 300,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     image: DecorationImage(
//                       image: FileImage(_pickedImage!),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//           Container(
//             height: 50,
//             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.green,
//               ),
//               onPressed: () async {
//                 setState(() {
//                   _scanning = true;
//                 });
//                 final pickedImage = await ImagePicker().pickImage(
//                   source: ImageSource.gallery,
//                 );

//                 if (pickedImage != null) {
//                   _pickedImage = File(pickedImage.path);
//                   _extractText = await FlutterTesseractOcr.extractText(
//                     _pickedImage!.path,
//                   );
//                 } else {
//                   // L'utilisateur n'a pas sélectionné d'image.
//                   // Vous pouvez gérer cela comme nécessaire.
//                 }

//                 setState(() {
//                   _scanning = false;
//                 });
//               },
//               child: Text(
//                 'Pick Image with text',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           _scanning
//               ? Center(child: CircularProgressIndicator())
//               : Icon(
//                   Icons.done,
//                   size: 40,
//                   color: Colors.green,
//                 ),
//           SizedBox(height: 20),
//           Center(
//             child: Text(
//               _extractText,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// 2222222
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_ocr_sdk/flutter_ocr_sdk.dart';
import 'package:flutter_ocr_sdk/flutter_ocr_sdk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OCR Flutter'),
        ),
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _pickedImage;
  String _extractedText = '';

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _startOCR() async {
    if (_pickedImage == null) {
      return;
    }

    final result = await FlutterOcr.extractText(_pickedImage!.path);
    setState(() {
      _extractedText = result ?? 'No text extracted';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _pickImage,
          child: Text('Pick Image'),
        ),
        ElevatedButton(
          onPressed: _startOCR,
          child: Text('Start OCR'),
        ),
        _pickedImage == null ? Container() : Image.file(_pickedImage!),
        Text(_extractedText),
      ],
    );
  }
}
