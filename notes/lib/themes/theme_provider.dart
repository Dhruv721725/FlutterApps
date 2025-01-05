import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/themes/dark.dart';
import 'package:notes/themes/light.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isdark=false;
  bool get isDarkMode =>_isdark;

  ThemeData get currentTheme=> 
    _isdark?darkMode:lighMode;

  void toggleTheme(){
    _isdark = !_isdark;
    notifyListeners();
  }
}