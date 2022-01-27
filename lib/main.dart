import 'package:flutter/material.dart';
import 'package:patterns_getx/pages/add_page.dart';
import 'package:patterns_getx/pages/home_page.dart';
import 'package:patterns_getx/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:HomePage(),
      routes:{
        HomePage.id:(context)=>HomePage(),
        UpdatePage.id:(context)=>UpdatePage(),
        AddPage.id:(context)=>UpdatePage(),
      },
    );
  }
}

