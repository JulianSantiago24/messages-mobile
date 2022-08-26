import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/models/posts_model.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
final _URL= 'jsonplaceholder.typicode.com';

class PostsService with ChangeNotifier {

  List<PostsResponse> messages = [];

  // ignore: non_constant_identifier_names
  PostsService() {
    this.getMessages();
  }

  getMessages() async {
    final url = Uri.https( _URL, '/posts' );
    final response = await http.get(url);
    final postsResponse = postsResponseFromJson( response.body );

    this.messages.addAll( postsResponse );
    notifyListeners();
  
  }
}