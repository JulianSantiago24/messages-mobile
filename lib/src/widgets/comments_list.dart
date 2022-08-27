import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/models/comments_model.dart';



class CommentsList extends StatelessWidget {

  final List<CommentsResponse> comments;
  
  const CommentsList(this.comments);

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: this.comments.length,
      itemBuilder: (BuildContext context, int index) {
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
                      this.comments[index].email.characters.first,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  SizedBox(width: 10.0),
                  Text(this.comments[index].email),
                ],
              ),
              SizedBox(height: 10.0),
              Text('${this.comments[index].body[0].toUpperCase()}${this.comments[index].body.substring(1)}'),
              SizedBox(height: 10.0),
            ],
          )
        );
      }
    );
  }
}