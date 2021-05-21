import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:verbose_register/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Verbose User',
      theme: ThemeData.dark(),
      home: LoginPage(),
      //home: CreateOrder(),
      //home: Orders(),
    );
  }
}
