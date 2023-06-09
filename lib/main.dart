import 'package:flutter/material.dart';
import 'package:listess/models/etudiants_models.dart';
import 'package:listess/services/etudiant_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Etudiant> allEtudiants = [];
  List<Etudiant> mae1Etudiants = [];

  @override
  void initState() {
    super.initState();
    fetchEtudiants();
  }

  Future<void> fetchEtudiants() async {
    try {
      List<Etudiant> etudiants = await EtudiantService.getAllEtudiants();
      List<Etudiant> mae1Etudiants = await EtudiantService.getEtudiantsByClasse('MAE1');

      setState(() {
        allEtudiants = etudiants;
        this.mae1Etudiants = mae1Etudiants;
      });
    } catch (e) {
      print('Erreur lors de la récupération des étudiants: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listess'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'étudiants:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allEtudiants.length,
            itemBuilder: (context, index) {
              Etudiant etudiant = allEtudiants[index];
              return ListTile(
                title: Text(etudiant.nom+etudiant.prenom),
                subtitle: Text(etudiant.matricule),
                leading: Text(etudiant.classe),
                trailing: Text(etudiant.email),
              );
            },
          ),
          SizedBox(height: 20),
          Text(
            'Étudiants de la classe MAE1:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mae1Etudiants.length,
            itemBuilder: (context, index) {
              Etudiant etudiant = mae1Etudiants[index];
              return ListTile(
                title: Text(etudiant.nomComplet),
                subtitle: Text(etudiant.matricule),
                leading: Text(etudiant.classe),
                trailing: Text(etudiant.email),
              );
            },
          ),
        ],
      ),
    );
  }
}
