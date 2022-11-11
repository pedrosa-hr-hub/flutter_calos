import 'package:flutter/material.dart';
import 'package:flutter_calos/dataCount_page.dart';
import 'package:flutter_calos/dataList_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    const appTitle = 'Login';
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        home: Scaffold(
          appBar: AppBar( 
            title: const Text(appTitle),
            backgroundColor: Colors.green,
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
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _userController,
              decoration: const InputDecoration(
                labelText: "Usuário",
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
              obscureText: true,
              controller: _passController,
              decoration: const InputDecoration(
                labelText: "Senha",
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
    String user = _userController.text;
    String pass = _passController.text;

    http.Response response = await createVoto(user, pass);

    if(response.statusCode == 200){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:(context) => DataPageCount()));
    }

    }

    Future<http.Response> createVoto(String user, String pass) {
    return http.post(
        Uri.parse('http://10.0.2.2:8000/user'),
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