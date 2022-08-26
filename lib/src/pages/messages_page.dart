
import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/services/services.dart';
import 'package:flutter_app_messages/src/widgets/message_list.dart';
import 'package:provider/provider.dart';

class MessagesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final postsService = Provider.of<PostsService>(context);

    // postsService.messages;
    
    return Scaffold(
      body: MessagesList( postsService.messages )
    );
  }
}