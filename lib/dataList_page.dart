import 'package:flutter/material.dart';
import 'package:flutter_calos/home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_calos/model/votoList_model.dart';

class DataPageList extends StatelessWidget {

  Future<List<Voto>> votofuturo = getVoto();

  DataPageList({super.key});

  static Future<List<Voto>> getVoto() async{
    const url = 'http://10.0.2.2:8000/consulta';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Voto>(Voto.fromJson).toList();
  }

  @override
   Widget build(BuildContext context) {
    const appTitle = 'Dados Sinteticos';
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        home: Scaffold(
          appBar: AppBar( 
            title: const Text(appTitle),
            leading: IconButton(
            onPressed: () {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:(context) => HomePage()));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.green,
          ),
          body: 
          Center(
            child: FutureBuilder<List<Voto>>(
              future: votofuturo,
              builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final votos = snapshot.data!;

                      return DataVotos(votos);
                    } else {
                      return const Text('No Data');
                    }
                  }
                ),
              ),
        ),
      );
   }

    Widget DataVotos(List<Voto> votos) => ListView.builder(
      itemCount: votos.length,
      itemBuilder: (context, index){
        final voto = votos[index];

        return Card(
          child: ListTile(
            title: Text(voto.voto),
            subtitle: Text(voto.email),
            ),
          );
        },
      );
}
