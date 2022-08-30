import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/models/posts_model.dart';
import 'package:flutter_app_messages/src/pages/details_page.dart';
import 'package:flutter_app_messages/src/pages/favorites_page.dart';
import 'package:flutter_app_messages/src/services/services.dart';
import 'package:provider/provider.dart';


class MessagesList extends StatefulWidget {

  final List<PostsResponse> messages;
  

  const MessagesList(this.messages);

  @override
  _MessagesListState createState() => _MessagesListState();
}


class _MessagesListState extends State<MessagesList> {

  @override
  Widget build(BuildContext context) {


    final favorite = Provider.of<FavoriteMessages>(context);
    final favoriteList = favorite.listFavoritesMessages;
    final postsService = Provider.of<PostsService>(context);

    Future onRefresh() async {
      setState(() {   
        postsService.getMessages();
      });
    }

    return RefreshIndicator( 
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: this.widget.messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: UniqueKey(),
            background: Container(
              color: Colors.redAccent[400],
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.delete, color: Colors.white),
                    Text('Move to trash', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            onDismissed: (direction) {
              //this.widget.messages.removeAt(index);
              setState(() {
                this.widget.messages.removeAt(index);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(30),
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
                          '${this.widget.messages[index].title[0].toUpperCase()}${this.widget.messages[index].title.substring(1)}',
                           textAlign: TextAlign.start),
                      ),
                      IconButton(
                        icon: GestureDetector(child: Icon(this.widget.messages[index].isFavorite ? Icons.star_rate_sharp:Icons.star_outline_outlined,color: Colors.yellow[800])),
                        onPressed: (){                      
                          favoriteList.add(
                            PostsResponse(
                              title: '${this.widget.messages[index].title[0].toUpperCase()}${this.widget.messages[index].title.substring(1)}',
                              body: '${this.widget.messages[index].body[0].toUpperCase()}${this.widget.messages[index].body.substring(1)}',
                              id: this.widget.messages[index].id,
                            )
                          );  
                          setState(() {
                            this.widget.messages[index].isFavorite  = true;               
                          });
                        }
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert_rounded, color: Theme.of(context).accentColor, semanticLabel: "Details",),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailsPage(
                              title: '${this.widget.messages[index].title[0].toUpperCase()}${this.widget.messages[index].title.substring(1)}',
                              description: '${this.widget.messages[index].body[0].toUpperCase()}${this.widget.messages[index].body.substring(1)}',
                              id: this.widget.messages[index].id,
                            )
                            )            
                          );
                          postsService.ids.clear();
                          postsService.ids.add(this.widget.messages[index].id);                          
                        }
                      ),
                    ],
                  ),                      
                ],
              )
            ),
          );
        }
      ),
    );
  }
}