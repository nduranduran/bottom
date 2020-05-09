import 'dart:convert';

import 'package:bottomnavegationbar/src/ui/widgets/buttonnavegation.dart';
import 'package:flutter/material.dart';

class PageCuatro extends StatefulWidget {
  @override
  _PageCuatroState createState() => _PageCuatroState();
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class _PageCuatroState extends State<PageCuatro> {



  @override
  Widget build(BuildContext context) {

    ScreenArguments  args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Pagina4"),leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),),
      body: Container(
        child: Text(args.title==null?'titulo default':args.title),
      ),
    );
  }
}