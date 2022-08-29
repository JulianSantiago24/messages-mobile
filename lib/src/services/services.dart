import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/models/comments_model.dart';
import 'package:flutter_app_messages/src/models/posts_model.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
final _URL = 'jsonplaceholder.typicode.com';

class PostsService with ChangeNotifier {

  List<PostsResponse> messages = [];
  List<int> ids = [];

  // ignore: non_constant_identifier_names
  PostsService() {
    this.getMessages();
  }

  getMessages() async {
    final url = Uri.https( _URL, '/posts' );
    final response = await http.get(url);
    final postsResponse = postsResponseFromJson( response.body );

    this.messages.addAll( postsResponse );
    messages.forEach((element) {
     this.ids.add(element.id);
    });
    
    notifyListeners();
  
  }


}

class CommentsService with ChangeNotifier {

  List<CommentsResponse> comments = [];

  // ignore: non_constant_identifier_names
  CommentsService( int value ) {
    this.getComments(value);
  }

  getComments( int value ) async {
    
    final url = Uri.https( _URL, '/posts/$value/comments' );
    final response = await http.get(url);
    final commentsResponse = commentsResponseFromJson( response.body );

    this.comments.addAll( commentsResponse );
    notifyListeners();
  
  }
}