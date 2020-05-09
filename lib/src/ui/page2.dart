import 'package:bottomnavegationbar/src/blocs/PostsBloc.dart';
import 'package:bottomnavegationbar/src/models/PostsModel.dart';
import 'package:bottomnavegationbar/src/ui/widgets/buttonnavegation.dart';
import 'package:flutter/material.dart';

class PageDos extends StatefulWidget {
  @override
  _PageDosState createState() => _PageDosState();
}

class _PageDosState extends State<PageDos> with AutomaticKeepAliveClientMixin<PageDos> {

final postBloc = PostsBloc();

bool cambio=false;

@override
void initState() {
  super.initState();
  print("********************** pagina 2 ********************");
  postBloc.getPosts();
}

@override
void dispose() {
  postBloc.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {

    print("se reconstruye todo");
    
    return Scaffold(
      appBar: AppBar(title: Text("Pagina2"),leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),),
      body: Container(
        child: SingleChildScrollView(
          child: StreamBuilder(
                stream: postBloc.outPosts,
                builder: (BuildContext context, AsyncSnapshot<List<PostsModel>> snapshot){
                  if(snapshot.hasData){
                    return Column(
                      children: snapshot.data.map((PostsModel post){
                        return Row(
                          children: <Widget>[
                            
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  // setState(() {
                                  //   cambio =true;
                                  // });
                                  cambio=!cambio;
                                  postBloc.cambioColor(!cambio);
                                },
                                child: StreamBuilder(
                                  stream: postBloc.outBool,
                                  initialData: false,
                                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
                                    
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: !snapshot.data?Colors.purple:Colors.red),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                                      ),
                                      margin: EdgeInsets.all(16.0),
                                      padding: EdgeInsets.all(8.0),
                                    child: Text(post.title),
                                  );
                                  },
                                ),
                              ))
                          ],
                        );
                      }).toList(),
                    );
                  }else{
                    return Center(
                      child: Text("Cargando....."),
                    );
                  }
                },
              ),
        ),
      ),
      
      
    );
  }
   @override
  bool get wantKeepAlive => true;

}