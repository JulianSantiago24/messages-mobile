import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/pages/favorites_page.dart';
import 'package:flutter_app_messages/src/pages/home_page.dart';
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
          update: (context, postsService, previousMessages) => new CommentsService( postsService.ids.single ),
          create: (BuildContext context) => CommentsService(null),
        ),
        //ChangeNotifierProvider(create: (_)=> new CommentsService()),
        ChangeNotifierProvider(create: (_)=> new FavoriteMessages() ),
      ],
      child: ChangeNotifierProvider(
        create: (_) => ThemeChanger(ThemeData.dark().copyWith(
                accentColor: Colors.lightBlue,
                primaryColor: Colors.blueAccent[700]
              )),
        child: MaterialAppTheme()
      ),
    );
  }
}

class MaterialAppTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: HomePage(),
    );
  }
}