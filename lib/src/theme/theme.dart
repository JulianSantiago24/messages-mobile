import 'package:flutter/material.dart';

// final myTheme = ThemeData.dark().copyWith(
//   accentColor: Colors.lightBlue,
//   primaryColor: Colors.blueAccent[700]
// );


class ThemeChanger with ChangeNotifier {

  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme( ThemeData theme ) {
    this._themeData = theme;
    notifyListeners();
  }

}