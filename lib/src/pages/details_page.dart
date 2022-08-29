import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/services/services.dart';
import 'package:flutter_app_messages/src/widgets/comments_list.dart';
import 'package:provider/provider.dart';


class DetailsPage extends StatefulWidget {

  final String title;
  final String description;
  final int id;

  DetailsPage({
    this.title,
    this.description,
    this.id,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  

 
  @override
  Widget build(BuildContext context) {

    final commentsService = Provider.of<CommentsService>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            //postsService.messages.clear();
            commentsService.comments.clear();
            commentsService.notifyListeners();                        
            Navigator.pop(context);
          } 
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text('DETAILS'),
        centerTitle: true,
        toolbarOpacity: 0.7,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
        body: Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.0),
                Text('TITLE', style: TextStyle(color: Theme.of(context).accentColor)),
                Text(this.widget.title),
                SizedBox(height: 10.0),
                Text('DESCRIPTION', style: TextStyle(color: Theme.of(context).accentColor)),
                Text(this.widget.description, textAlign: TextAlign.justify),
                Text('ID ${this.widget.id.toString()}'),
                SizedBox(height: 30.0),
                Text('COMMENTS', style: TextStyle(color: Theme.of(context).accentColor),),
                SizedBox(height: 20.0),
                Expanded(child: CommentsList(commentsService.comments)),
              ],
            )
          ),
        )
    );
  }
}



