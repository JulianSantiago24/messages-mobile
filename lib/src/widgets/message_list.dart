import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/models/posts_model.dart';


class MessagesList extends StatelessWidget {

  final List<PostsResponse> messages;

  const MessagesList(this.messages);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.messages.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(this.messages[index].title);
      }
    );
  }
}