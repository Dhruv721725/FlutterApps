import 'package:chatz/theme/dark_mode.dart';
import 'package:chatz/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier{
    ThemeData _themeData = lightMode;

    ThemeData get themeData => _themeData;

    bool get isDarkMode => _themeData==darkMode;

    set themeData(ThemeData themeData){
        _themeData=themeData;
    }

    void toggleTheme(){
        if (_themeData==lightMode) {
          themeData=darkMode;
        }else{
            themeData=lightMode;
        }
        notifyListeners();
    }
}