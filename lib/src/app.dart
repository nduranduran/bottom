
import 'package:bottomnavegationbar/src/ui/page1.dart';
import 'package:bottomnavegationbar/src/ui/page2.dart';
import 'package:bottomnavegationbar/src/ui/page3.dart';
import 'package:bottomnavegationbar/src/ui/page4.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
      '/': (BuildContext context) => PageUno(),
      '/b': (BuildContext context) => PageDos(),
      '/c': (BuildContext context) => PageTres(),
      '/d': (BuildContext context) => PageCuatro(),
    },
    );
  }
}
