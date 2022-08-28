
import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/services/services.dart';
import 'package:flutter_app_messages/src/widgets/message_list.dart';
import 'package:provider/provider.dart';

class MessagesPage extends StatefulWidget {

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  @override
  Widget build(BuildContext context) {


    final postsService = Provider.of<PostsService>(context);
    final messagesList = postsService.messages;


    return Scaffold(
      body: MessagesList( messagesList ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          setState(() {
            messagesList.clear();         
          });
        },
        child: const Icon(Icons.delete_sweep_outlined),
        backgroundColor: Theme.of(context).accentColor,
      ),
      floatingActionButtonLocation:    FloatingActionButtonLocation.miniStartFloat,
    );
  }
}