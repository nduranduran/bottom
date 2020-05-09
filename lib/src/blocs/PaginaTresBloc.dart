import 'package:rxdart/rxdart.dart';

class PaginaTresBloc {
  final listaColores = PublishSubject<String>();

  Observable<String> get outListColors => listaColores.stream;

  cambiarColor(String color){
    listaColores.sink.add(color);
  }

}