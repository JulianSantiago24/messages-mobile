import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/models/comments_model.dart';
import 'package:flutter_app_messages/src/services/services.dart';
import 'package:provider/provider.dart';


class CommentsList extends StatefulWidget {

  final List<CommentsResponse> comments;
  
  const CommentsList(this.comments);

  @override
  _CommentsListState createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  
  
  @override
  Widget build(BuildContext context) {

    final commentsService = Provider.of<CommentsService>(context);
    final postsService = Provider.of<PostsService>(context);

    commentsService.getComments(postsService.ids.single);
    
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: commentsService.comments.length,
      itemBuilder: (BuildContext context, int index ) {
        //return Text(this.messages[index].userId.toString());
        return Container(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 5),
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
                  CircleAvatar(
                    radius: 16.0,
                    child: Text(
                      commentsService.comments[index].email.characters.first,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  SizedBox(width: 10.0),
                  Text(commentsService.comments[index].email),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                '${commentsService.comments[index].body[0].toUpperCase()}${commentsService.comments[index].body.substring(1)}',
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10.0),
            ],
          )
        );
      }
    );
  }
}