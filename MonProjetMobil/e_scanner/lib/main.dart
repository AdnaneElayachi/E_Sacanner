// ... (Previous code)

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController urlController = TextEditingController();
  String fetchedData = ''; // Added to store fetched data

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(urlController.text));
    if (response.statusCode == 200) {
      // Traitement des données
      final data = json.decode(response.body);
      setState(() {
        fetchedData = data.toString(); // Update fetched data
      });
    } else {
      // Gestion des erreurs
      setState(() {
        fetchedData = 'Erreur ${response.statusCode}';
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
            TextFormField(
              controller: urlController,
              decoration: InputDecoration(labelText: 'URL de l\'image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Charger l\'image'),
            ),
            SizedBox(height: 20),
            // Display the fetched data
            Text(
              'Données récupérées : $fetchedData',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
