
import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/services/services.dart';
import 'package:flutter_app_messages/src/widgets/message_list.dart';
import 'package:provider/provider.dart';

class MessagesPage extends StatelessWidget with ChangeNotifier{

  @override
  Widget build(BuildContext context) {

    final postsService = Provider.of<PostsService>(context);
    
    return Scaffold(
      body: MessagesList( postsService.messages ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          print('borrandoo');
        },
        child: const Icon(Icons.delete_sweep_outlined),
        backgroundColor: Theme.of(context).accentColor,
      ),
      floatingActionButtonLocation:    FloatingActionButtonLocation.miniStartFloat,
    );
  }

}