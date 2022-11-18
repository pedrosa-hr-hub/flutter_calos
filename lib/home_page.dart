import 'package:flutter/material.dart';
import 'package:flutter_calos/dataCount_page.dart';
import 'package:flutter_calos/dataList_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    const appTitle = 'Home';
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

  @override
     Widget build(BuildContext context) {
      return Builder(
        builder: (context) {
          return Center(
            key: _formLoginKey,
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.green,
                  ),
                  onPressed: () {

                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:(context) => DataPageList()));
                    
                  },
                  child: const Text('Dados Listados'),
                ),
                ),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.green,
                  ),
                  onPressed: () {

                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:(context) => DataPageCount()));
                    
                  },
                  child: const Text('Dados Sinteticos'),
                ),
                ),
              ],
            ),
          );
        }
      );
     }

    }