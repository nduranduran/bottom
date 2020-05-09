import 'package:bottomnavegationbar/src/ui/widgets/buttonnavegation.dart';
import 'package:flutter/material.dart';

class PageTres extends StatefulWidget {
  @override
  _PageTresState createState() => _PageTresState();
}

class _PageTresState extends State<PageTres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagina3"),leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),),
      body: GestureDetector(
                onTap: (){
                  print("regresando a la pantalla c");
                  Navigator.popUntil(context, ModalRoute.withName('/c'));
                },
                child: Container(
                margin: EdgeInsets.all(10.0),
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              ),
    );
  }
}