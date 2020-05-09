import 'package:bottomnavegationbar/src/ui/widgets/buttonnavegation.dart';
import 'package:flutter/material.dart';

class PageCuatro extends StatefulWidget {
  @override
  _PageCuatroState createState() => _PageCuatroState();
}

class _PageCuatroState extends State<PageCuatro> {
  @override
  Widget build(BuildContext context) {
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
        child: Text("Hola pagina 4"),
      ),
    );
  }
}