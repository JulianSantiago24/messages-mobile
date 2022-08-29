
import 'package:flutter/material.dart';
import 'package:flutter_app_messages/src/pages/pages.dart';
import 'package:flutter_app_messages/src/theme/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

     final theme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Messages APP'),
      ),
      body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( 
                "HI",
                style: TextStyle( 
                    fontStyle: FontStyle.italic,
                    fontSize: 45,
                    height: 0.9,
                    color: Colors.yellowAccent[700],
                    decoration: TextDecoration.lineThrough,
                ),
              ),
              Text( 
                "HELLO",
                style: TextStyle( 
                    fontStyle: FontStyle.italic,
                    fontSize: 45,
                    height: 0.9,
                    color: Colors.redAccent[400],
                    decoration: TextDecoration.lineThrough,
                ),
              ),
              Text( 
                "WELCOME!",
                style: TextStyle( 
                    fontStyle: FontStyle.italic,
                    fontSize: 45,
                    height: 0.9,
                    color: Colors.greenAccent[400],
                ),
              ),
              SizedBox(height: 100,),
              ElevatedButton.icon(    
                icon: Icon( // <-- Icon
                  Icons.wb_sunny_rounded,
                  size: 24.0,
                ),
                label: Text('Light'),
                onPressed: () {
                  theme.setTheme(ThemeData.light());
                },
              ),
              ElevatedButton.icon(               
                icon: Icon( // <-- Icon
                  Icons.brightness_3,
                  size: 24.0,
                ),
                label: Text('Dark'),
                 onPressed: () {
                 theme.setTheme(ThemeData.dark().copyWith(
                    accentColor: Colors.lightBlue,
                    primaryColor: Colors.blueAccent[700]
                  ));
                }, 
              ),
              SizedBox(height: 70,),
              RichText(
                text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Made with ❤ by JulianJaramillo',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontFamily: 'EmojiOne',
                    ),
                  ),
                ],
                ),
                )
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.login_rounded),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TabsPage()
            )            
          );
                          
        }
      )
    );
  }
}