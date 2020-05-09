import 'package:bottomnavegationbar/src/blocs/PaginaTresBloc.dart';
import 'package:bottomnavegationbar/src/ui/widgets/buttonnavegation.dart';
import 'package:flutter/material.dart';

class PageTres extends StatefulWidget {
  @override
  _PageTresState createState() => _PageTresState();
}

class _PageTresState extends State<PageTres> {

  var bloc  = PaginaTresBloc();

  var color = 'red';

  @override
  Widget build(BuildContext context) {

    print("recunstruyendo todo *****************************");

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: bloc.outListColors,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                if(snapshot.hasData){
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    color: colores(snapshot.data),
                    height: 90,
                    width: 90,
                  );
                }else{
                  return Container();
                }
              },
            ),
             FlatButton(onPressed: (){
              //  setState(() {
              //    color = 'orange';
              //  });
              color = 'green';
                bloc.cambiarColor(color);
             }, child:Text('Clic') )
          ],
        ),
      ),
    );
  }
}

colores(color){
if(color=='red'){
  return Colors.red;
}
if(color=='green'){
  return Colors.green;
}
if(color=='yellow'){
  return Colors.yellow;
}
if(color=='purple'){
  return Colors.purple;
}
}
