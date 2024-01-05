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

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
  TextEditingController imageUrlController = TextEditingController();
  String ocrResult = '';
  XFile? pickedImage;

  Future<Map<String, dynamic>> performOCR(String imageUrl) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/ocrapi/'),
        body: {'image_url': imageUrl},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
          'Erreur lors de la requête HTTP (${response.statusCode}): ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('Erreur inattendue lors de l\'OCR: $e');
    }
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        pickedImage = XFile(pickedFile.path);
      });
    }
  }

  Future<void> fetchData() async {
    if (pickedImage == null) {
      setState(() {
        ocrResult = 'Aucune image sélectionnée.';
      });
      return;
    }
    try {
      Map<String, dynamic> result = await performOCR(pickedImage!.path);

      setState(() {
        ocrResult = result['resultat'];
      });
    } catch (e) {
      print('Erreur lors de l\'OCR: $e');
      setState(() {
        ocrResult = 'Erreur de connexion: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OCR App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pickedImage != null)
              kIsWeb
                  ? Image.network(pickedImage!.path, height: 100.0)
                  : Image.file(File(pickedImage!.path), height: 100.0),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Choisir une image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Effectuer l\'OCR'),
            ),
            SizedBox(height: 20),
            Text(
              'Résultat OCR : $ocrResult',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
