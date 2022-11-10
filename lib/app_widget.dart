import 'package:flutter/material.dart';
import 'package:flutter_calos/dataList_page.dart';
import 'package:flutter_calos/home_page.dart';
import 'package:flutter_calos/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget
  ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/data',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/data': (context) => DataPageList()
      },
      
    );
    
  }
}