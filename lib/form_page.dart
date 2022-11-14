import 'package:flutter/material.dart';
import 'package:flutter_calos/login_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FormPage extends StatelessWidget {
  const FormPage({ Key? key }) : super(key: key);

  @override
   Widget build(BuildContext context) {
    const appTitle = 'Votação';
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        home: Scaffold(
          appBar: AppBar( 
            title: const Text(appTitle),
            backgroundColor: Colors.green,
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
                labelText: "Voto",
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), //<-- SEE HERE
                  ),
                    floatingLabelStyle: TextStyle(color: Colors.green),
                ),
                cursorColor:  Colors.green,
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
                labelText: "Email",
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), //<-- SEE HERE
                  ),
                    floatingLabelStyle: TextStyle(color: Colors.green),
                ),
                cursorColor:  Colors.green,
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
                labelText: "Nome",
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), //<-- SEE HERE
                  ),
                    floatingLabelStyle: TextStyle(color: Colors.green),
                ),
                cursorColor:  Colors.green,
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
                labelText: "Cidade",
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), //<-- SEE HERE
                  ),
                    floatingLabelStyle: TextStyle(color: Colors.green),
                ),
                cursorColor:  Colors.green,
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
                labelText: "Estado",
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), //<-- SEE HERE
                  ),
                    floatingLabelStyle: TextStyle(color: Colors.green),
                ),
                cursorColor:  Colors.green,
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
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.green,
              ),
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
        Uri.parse('http://10.0.2.2:8000/voto'),
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
