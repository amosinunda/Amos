import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Personne extends StatefulWidget {
  const Personne({Key? key}) : super(key: key);

  @override
  State<Personne> createState() => _PersonneState();
}

class _PersonneState extends State<Personne> {
  TextEditingController txtnom = new TextEditingController();
  TextEditingController txtadresse = new TextEditingController();
  TextEditingController txttelephone = new TextEditingController();

  //fonction asych

  Future<void> addData() async {
    var url = "http://localhost/isig_2022/postdata.php";
    final reponse = await http.post(Uri.parse(url), body: {
      "nom": txtnom.text,
      "adresse": txtadresse.text,
      "telephone": txttelephone.text
    });
    print('Enregistrement réussi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IDENTIFICATION"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          new TextField(
              controller: txtnom,
              decoration:
                  InputDecoration(labelText: "Nom", hintText: "Entrer le nom")),
          SizedBox(
            width: 20,
          ),
          new TextField(
            controller: txtadresse,
            decoration: InputDecoration(
                labelText: "Adresse", hintText: "Entrez votre adresse"),
          ),
          SizedBox(
            width: 20,
          ),
          new TextField(
            controller: txttelephone,
            decoration: InputDecoration(
                labelText: "Contact", hintText: "Entrez votre contact"),
          ),
          SizedBox(
            width: 20,
          ),
          new RaisedButton(
            onPressed: () {
              addData();
            },
            child: Text("Enregistrer"),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
