import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/services/services.dart';
import 'package:flutter_app_messages/src/widgets/comments_list.dart';
import 'package:provider/provider.dart';


class DetailsPage extends StatelessWidget {

  final String title;
  final String description;
  final int id;

  DetailsPage({
    this.title,
    this.description,
    this.id,
  });
 
  @override
  Widget build(BuildContext context) {

    final commentsService = Provider.of<CommentsService>(context);

    return Scaffold(
      appBar: AppBar(
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
      body: (commentsService.comments.length == 0)
        ? Center(child: CircularProgressIndicator(),)
        : _Body(title: title, description: description, id: id, commentsService: commentsService),
    );
  }
}

class _Body extends StatelessWidget {

  const _Body({
    Key key,
    @required this.title,
    @required this.description,
    @required this.id,
    @required this.commentsService,
  }) : super(key: key);

  final String title;
  final String description;
  final int id;
  final CommentsService commentsService;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.0),
            Text('TITLE', style: TextStyle(color: Theme.of(context).accentColor)),
            Text(this.title),
            SizedBox(height: 10.0),
            Text('DESCRIPTION', style: TextStyle(color: Theme.of(context).accentColor)),
            Text(this.description, textAlign: TextAlign.justify),
            Text('ID ${this.id.toString()}'),
            SizedBox(height: 30.0),
            Text('COMMENTS', style: TextStyle(color: Theme.of(context).accentColor),),
            SizedBox(height: 20.0),
            Expanded(child: CommentsList(commentsService.comments)),
          ],
        )
      ),
    );
  }
}

