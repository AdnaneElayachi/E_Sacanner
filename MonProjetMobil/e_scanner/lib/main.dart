import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  Future<void> fetchData() async {
    final response = await http.get('http://localhost/data:8000' as Uri);
    if (response.statusCode == 200) {
      // Traitement des données
      final data = json.decode(response.body);
      print(data);
    } else {
      // Gestion des erreurs
      print('Erreur ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Scanner'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchData,
          child: Text(''),
        ),
      ),
    );
  }
}



