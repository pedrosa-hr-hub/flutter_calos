import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Votação';
      return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar( 
            title: const Text(appTitle),
          ),
          body: const MyFormLogin(),
        ),
      );
   }
  }

  class MyFormLogin extends StatefulWidget {
    const MyFormLogin({super.key});

    @override
    MyFormState createState(){
      return MyFormState();
    }
  }

  class MyFormState extends State<MyFormLogin> {
  final _formLoginKey = GlobalKey<FormState>();

  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
     Widget build(BuildContext context) {
      return Form(
        key: _formLoginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _userController,
              decoration: const InputDecoration(
                labelText: "Usuário"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite algum valor';
                  }
                  return null;
                },
            ),
            TextFormField(
              obscureText: true,
              controller: _passController,
              decoration: const InputDecoration(
                labelText: "Senha"
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
    String user = _userController.text;
    String pass = _passController.text;

    http.Response response = await createVoto(user, pass);

    if(response.statusCode == 200){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:(context) =>const HomePage()));
    }

    }

    Future<http.Response> createVoto(String user, String pass) {
    return http.post(
        Uri.parse('http://localhost:8000/user'),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
            'user': user,
            'pass': pass,
          }),
        );
      }
    }