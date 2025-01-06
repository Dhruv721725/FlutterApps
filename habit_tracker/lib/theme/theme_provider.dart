import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/dark_mode.dart';
import 'package:habit_tracker/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark=false;
  bool get isDark => _isDark;
  
  ThemeData currentTheme(){
    return _isDark ? darkMode : lightMode;
  }
  void toggleMode(){
    _isDark=!_isDark;
    notifyListeners();
  }
}