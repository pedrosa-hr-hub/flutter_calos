import 'package:flutter/material.dart';
import 'package:flutter_calos/login_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
   Widget build(BuildContext context) {
    const appTitle = 'Votação';
      return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar( 
            title: const Text(appTitle),
          ),
          body: const MyForm(),
        ),
      );
   }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  MyFormState createState(){
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  final _votoController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();

  @override
     Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _votoController,
              decoration: const InputDecoration(
                labelText: "Voto"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite algum valor';
                  }
                  return null;
                },
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite algum valor';
                  }
                  return null;
                },
            ),
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: "Nome"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite algum valor';
                  }
                  return null;
                },
            ),
            TextFormField(
              controller: _cidadeController,
              decoration: const InputDecoration(
                labelText: "Cidade"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite algum valor';
                  }
                  return null;
                },
            ),
            TextFormField(
              controller: _estadoController,
              decoration: const InputDecoration(
                labelText: "Estado"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite algum valor';
                  }
                  return null;
                },
            ),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                _sendData(context);
              },
              child: const Text('Enviar'),
            ),
            ),
          ],
        ),
      );
      }
    
    _sendData(context) async {
    String voto = _votoController.text;
    String email = _emailController.text;
    String nome = _nomeController.text;
    String cidade = _cidadeController.text;
    String estado = _estadoController.text;

    http.Response response = await createVoto(voto, email, nome, cidade, estado);

    if(response.statusCode == 201){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:(context) =>const LoginPage()));
    }

    }

    Future<http.Response> createVoto(String voto, String email, String nome, String cidade, String estado) {
    return http.post(
        Uri.parse('http://localhost:8000/voto'),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
            'voto': voto,
            'email': email,
            'nome': nome,
            'cidade': cidade,
            'estado': estado
          }),
        );
      }
    


}
