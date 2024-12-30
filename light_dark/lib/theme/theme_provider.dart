import 'package:flutter/material.dart';
import 'package:light_dark/theme/theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData=lightMode;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData td){
    _themeData=td;
    notifyListeners();
  }

  void toggleTheme(){
    if(themeData==lightMode){
      themeData=darkMode;
    }else{
      themeData=lightMode;
    }
  }
}