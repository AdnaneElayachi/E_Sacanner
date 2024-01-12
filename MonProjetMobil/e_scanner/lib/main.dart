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

// // 222222222222222222222222
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
//   String _extractedText = '';
//   File? _pickedImage;

//   Future<void> _pickImageAndStartOCR() async {
//     setState(() {
//       _scanning = true;
//     });

//     final pickedImage = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );

//     if (pickedImage != null) {
//       _pickedImage = File(pickedImage.path);
//       await _startOCR();
//     }

//     setState(() {
//       _scanning = false;
//     });
//   }

//   Future<void> _startOCR() async {
//     if (_pickedImage == null) {
//       return;
//     }

//     final result = await FlutterTesseractOcr.extractText(_pickedImage!.path);
//     print('Texte extrait : $result');

//     setState(() {
//       _extractedText = result ?? 'No text extracted';
//     });
//   }

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
//               onPressed: _scanning ? null : _pickImageAndStartOCR,
//               child: Text(
//                 'Pick Image and Start OCR',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           _scanning
//               ? Center(child: CircularProgressIndicator())
//               : FutureBuilder<void>(
//                   future: _startOCR(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       return Icon(
//                         Icons.done,
//                         size: 40,
//                         color: Colors.green,
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text('Erreur : ${snapshot.error}');
//                     } else {
//                       return CircularProgressIndicator();
//                     }
//                   },
//                 ),
//           SizedBox(height: 20),
//           Center(
//             child: Text(
//               _extractedText.replaceAll('\n', ' '),
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// 33333333333333333333333333333333

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
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
//   bool isLoading = false;
//   final ImagePicker _picker = ImagePicker();
//   File? _pickedImage;
//   String _extractedText = '';

//   Future<void> pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _pickedImage = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _startOCR() async {
//     try {
//       final result = await FlutterTesseractOcr.extractText(_pickedImage!.path);
//       print('Texte extrait : $result');

//       setState(() {
//         _extractedText = result ?? 'No text extracted';
//       });
//     } catch (e) {
//       print('Erreur lors de l\'extraction du texte : $e');
//       setState(() {
//         _extractedText = 'Error during text extraction';
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
//             if (_pickedImage != null) Image.network(_pickedImage!.path),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: isLoading
//                   ? null
//                   : () async {
//                       await _startOCR();
//                     },
//               child: Text('Charger l\'image et exécuter OCR'),
//             ),
//             SizedBox(height: 20),
//             if (isLoading)
//               CircularProgressIndicator()
//             else
//               Text(
//                 'Texte extrait : $_extractedText',
//                 style: TextStyle(fontSize: 16),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// 44444444444444444444444444444444444444444
//
//
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  File? _pickedImage;
  String _extractedText = '';

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
  }

  Future<void> _startOCR() async {
    if (_pickedImage == null) {
      return;
    }

    try {
      final result = await FlutterTesseractOcr.extractText(_pickedImage!.path);
      print('Texte extrait : $result');

      setState(() {
        _extractedText = result ?? 'No text extracted';
      });

      // Envoyer le fichier image à l'API Django
      await sendImageToDjango(_pickedImage!);
    } catch (e) {
      print('Erreur lors de l\'extraction du texte : $e');
      setState(() {
        _extractedText = 'Error during text extraction';
      });
    }
  }

  Future<void> sendImageToDjango(File imageFile) async {
    final apiUrl = 'http://127.0.0.1:8000/ocrapi';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..files.add(await http.MultipartFile.fromPath(
          'image_file',
          imageFile.path,
        ));

      var response = await request.send();

      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
            json.decode(await response.stream.bytesToString());
        // Traitez les données de la réponse ici
        print('Réponse de l\'API Django : $data');
      } else {
        print(
            'Erreur lors de la requête vers l\'API Django. Statut : ${response.statusCode}');
      }
    } catch (error) {
      print('Exception lors de la requête vers l\'API Django : $error');
      setState(() {
        _extractedText = 'Error during API request';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Sélectionner une image'),
            ),
            SizedBox(height: 20),
            if (_pickedImage != null) Image.file(_pickedImage!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      await _startOCR();
                    },
              child: Text('Charger l\'image et exécuter OCR'),
            ),
            SizedBox(height: 20),
            if (isLoading)
              CircularProgressIndicator()
            else
              Text(
                'Texte extrait : $_extractedText',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
