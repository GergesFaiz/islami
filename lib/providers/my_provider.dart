import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
   ThemeMode themeMode=ThemeMode.light;

  void changLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }
  void changTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
  String getBackgroundPath(){
    if(themeMode == ThemeMode.light){
      return "assets/images/background.png";
    }else{
      return "assets/images/home_dark_background.png";
    }
  }
}
