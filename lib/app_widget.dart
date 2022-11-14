import 'package:flutter/material.dart';
import 'package:flutter_calos/dataCount_page.dart';
import 'package:flutter_calos/dataList_page.dart';
import 'package:flutter_calos/form_page.dart';
import 'package:flutter_calos/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget
  ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const FormPage(),
        '/login': (context) => const LoginPage(),
        '/data': (context) => DataPageList(),
        '/count': (context) => DataPageCount()
      },
      
    );
    
  }
}