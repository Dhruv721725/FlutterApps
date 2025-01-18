import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/dark_theme.dart';
import 'package:habit_tracker/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme= lightMode;

  ThemeData get currentTheme => _currentTheme;

  bool get isDarkMode => (_currentTheme == darkMode);

  void toggleTheme(){
    if (_currentTheme==lightMode) {
      _currentTheme=darkMode;
    }else{
      _currentTheme=lightMode;
    }
    notifyListeners();
  }
}