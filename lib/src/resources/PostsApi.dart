import 'dart:convert';
import 'package:bottomnavegationbar/src/models/PostsModel.dart';
import 'package:http/http.dart' as http ; 

class PostApi {

  var client = http.Client();

  Future<List<PostsModel>> getPosts() async {
    try {
        final response = await client.get('https://jsonplaceholder.typicode.com/posts');

        print(response.body.toString());

        if (response.statusCode == 200) {
          var responseConvert = json.decode(response.body);
          List<PostsModel> postModelList= [];

          for (var i = 0; i < responseConvert.length; i++) {
            postModelList.add(PostsModel.fromJson(responseConvert[i])); 
          }

          return postModelList;
        } else {
          throw Exception('Error al realizar get');
        }

    } finally {
      client.close();
    }
  }


}
