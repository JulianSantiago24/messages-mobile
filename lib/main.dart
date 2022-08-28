import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/pages/favorites_page.dart';
import 'package:flutter_app_messages/src/pages/pages.dart';
import 'package:flutter_app_messages/src/services/services.dart';
import 'package:flutter_app_messages/src/theme/theme.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  @override
  Widget build(BuildContext context) {  

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new PostsService() ),
        ChangeNotifierProxyProvider<PostsService, CommentsService>(
          update: (context, postsService, previousMessages) => CommentsService(postsService.ids.single),
          create: (BuildContext context) => CommentsService(null),
        ),
        //ChangeNotifierProvider(create: (_)=> new CommentsService()),
        ChangeNotifierProvider(create: (_)=> new FavoriteMessages() ),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: TabsPage()
      ),
    );
  }
}