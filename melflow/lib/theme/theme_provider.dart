import 'package:flutter/material.dart';
import 'package:melflow/theme/dark_mode.dart';
import 'package:melflow/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData= lightMode;

  ThemeData get themeData => _themeData;

  bool get isDark => _themeData == darkMode;

  set themeData(ThemeData td){
    _themeData=td;
    notifyListeners();
  }
  
  void toggleTheme(){
    if (_themeData==darkMode) {
      _themeData=lightMode;
    }else{
      _themeData=darkMode;
    }
    notifyListeners();
  }
} 