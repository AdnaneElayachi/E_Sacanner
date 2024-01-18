import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _pickedImage = File(result.files.first.bytes! as String);
      });
    }
  }

  Future<void> _startOCR() async {
    if (_pickedImage == null) {
      return;
    }

    try {
      // Send the image to Django and get the extracted text
      const String apiUrl = 'http://localhost:8000/PostView/';
      final String? extractedText =
          await sendImageToDjango(apiUrl, _pickedImage!);

      print('Texte extrait : $extractedText');

      setState(() {
        _extractedText = extractedText ?? 'No text extracted';
      });
    } catch (e) {
      print('Erreur lors de l\'extraction du texte : $e');
      setState(() {
        _extractedText = 'Error during text extraction';
      });
    }
  }

  Future<String?> sendImageToDjango(String apiUrl, File imageFile) async {
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

        // Assuming that the API response contains the 'texte' field
        return data['texte'];
      } else {
        print(
            'Erreur lors de la requête vers l\'API Django. Statut : ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Exception lors de la requête vers l\'API Django : $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickImage,
              child: const Text('Sélectionner une image'),
            ),
            const SizedBox(height: 20),
            if (_pickedImage != null) Image.file(_pickedImage!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      setState(() {
                        isLoading = true;
                      });
                      await _startOCR();
                      setState(() {
                        isLoading = false;
                      });
                    },
              child: const Text('Charger l\'image et exécuter OCR'),
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const CircularProgressIndicator()
            else
              Text(
                'Texte extrait : $_extractedText',
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
