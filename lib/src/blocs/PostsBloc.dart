import 'package:bottomnavegationbar/src/resources/PostRepository.dart';
import 'package:bottomnavegationbar/src/models/PostsModel.dart';
import 'package:rxdart/rxdart.dart';

class PostsBloc {

  final _postsRepository = PostRepository();
  final _postsList = PublishSubject<List<PostsModel>>();

  final _cambio = PublishSubject<bool>();

  Observable<List<PostsModel>> get outPosts => _postsList.stream;
  Observable<bool> get outBool => _cambio.stream;

  getPosts()async{
    List<PostsModel> postsModel = await _postsRepository.getPosts();
    _postsList.sink.add(postsModel);
  }

  cambioColor(valor){
    _cambio.sink.add(valor);
  }

  dispose()async{
    await _postsList.drain();
    _postsList.close();

    await _cambio.drain();
    _cambio.close();
  }

}