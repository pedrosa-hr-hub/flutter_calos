import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_calos/model/votoCount_model.dart';

class DataPageCount extends StatelessWidget {

  Future<List<Voto>> votofuturo = getVoto();

  DataPageCount({super.key});

  static Future<List<Voto>> getVoto() async{
    const url = 'http://localhost:8000/sintect';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    List<Voto> teste = body.map<Voto>(Voto.fromJson).toList();
    double soma=0;
    teste.forEach((element) {
      soma=soma+element.qtd;
    });
    teste.forEach((element) {
      
      element.porcentagem= element.qtd/soma*100;
    });
    return teste;// body.map<Voto>(Voto.fromJson).toList();
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
