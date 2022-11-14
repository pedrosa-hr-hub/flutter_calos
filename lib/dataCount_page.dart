import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_calos/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_calos/model/votoCount_model.dart';

class DataPageCount extends StatelessWidget {

  Future<List<Voto>> votofuturo = getVoto();

  DataPageCount({super.key});

  static Future<List<Voto>> getVoto() async{
    const url = 'http://10.0.2.2:8000/sintect';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    List<Voto> voto = body.map<Voto>(Voto.fromJson).toList();
    double soma = 0;
    voto.forEach((element) {
      soma=soma+element.qtd;
    });
    voto.forEach((element) {
      
      element.porcentagem= element.qtd/soma*100;
    });
    return voto;
  }

  @override
   Widget build(BuildContext context) {
    const appTitle = 'Dados Listados';
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
          body: Center(
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
            subtitle: Text('${voto.porcentagem.toStringAsPrecision(2)} %'),
            ),
          );
        },
      );
}
