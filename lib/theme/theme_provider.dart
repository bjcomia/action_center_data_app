import 'package:action_center_data_app/theme/custom_themes.dart';
import 'package:flutter/material.dart';


// class ThemeProvider with ChangeNotifier{
//   ThemeMode _themeData = ThemeMode.dark;

//   bool get themeData => _themeData == ThemeData.dark();

//   // set themeData(ThemeData themeData){
//   //   _themeData = themeData;
//   //   notifyListeners();
//   // }

//   void toggleTheme( bool isOn){
//     _themeData = isOn ? ThemeMode.dark : ThemeData.light();
//     notifyListeners();
//   }
// }

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }else{
      themeData = lightMode;
    }
  }
}