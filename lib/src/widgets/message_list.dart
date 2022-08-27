import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/models/posts_model.dart';
import 'package:flutter_app_messages/src/pages/details_page.dart';


class MessagesList extends StatelessWidget {

  final List<PostsResponse> messages;
  
  final isFavourite = true;

  const MessagesList(this.messages);

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: this.messages.length,
      itemBuilder: (BuildContext context, int index) {
        //return Text(this.messages[index].userId.toString());
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: index == 0
                ? const Border() // This will create no border for the first item
                : Border(
                    top: BorderSide(
                      width: 1,
                      color: Theme.of(context).accentColor)
                  ), // This will create top borders for the rest
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${this.messages[index].title[0].toUpperCase()}${this.messages[index].title.substring(1)}',
                       textAlign: TextAlign.start),
                  ),
                  if (isFavourite) IconButton(
                    icon: Icon(Icons.star_rate_rounded, color: Colors.yellowAccent[700]),
                    onPressed: (){
                      print('Configurar como favorito');
                    }
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert_rounded, color: Theme.of(context).accentColor, semanticLabel: "Details",),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsPage(
                          title: '${this.messages[index].title[0].toUpperCase()}${this.messages[index].title.substring(1)}',
                          description: '${this.messages[index].body[0].toUpperCase()}${this.messages[index].body.substring(1)}',
                          id: this.messages[index].id,
                        )),
                      );
                      print('ir a detalles');
                    }
                  ),
                ],
              ),                      
            ],
          )
        );
      }
    );
  }
}