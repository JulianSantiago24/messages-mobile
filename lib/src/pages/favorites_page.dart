import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/models/posts_model.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {

    final favorite = Provider.of<FavoriteMessages>(context);
    final favoriteMesssage = favorite.listFavoritesMessages;


    return ListView.builder(
      itemCount: favoriteMesssage.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
                      '${favoriteMesssage[index].title[0].toUpperCase()}${favoriteMesssage[index].title.substring(1)}',
                       textAlign: TextAlign.start),
                  ),
                  Icon(Icons.star_rate, color: Colors.yellow[800]),
                ]
              )
            ]
          )
        );
      }
    );
  }
}

class FavoriteMessages extends ChangeNotifier {

  List<PostsResponse> _listFavoritesMessages = [];

  List<PostsResponse> get listFavoritesMessages {
    return _listFavoritesMessages;
  }

  set messageSelected(List<PostsResponse> list){
    _listFavoritesMessages = list;
    notifyListeners();
  }
}