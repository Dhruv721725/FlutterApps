import 'package:chatbot/theme/darkmode.dart';
import 'package:chatbot/theme/lightmode.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark=false;

  bool get isdark=>_isDark;
  
  ThemeData get theme=> _isDark? darkMode : lightMode;

  void toggleTheme(){
    _isDark=!_isDark;
    notifyListeners();
  }
}