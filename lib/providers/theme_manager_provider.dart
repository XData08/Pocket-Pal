import "package:flutter/material.dart";


class ThemeManagerProvider with ChangeNotifier{
  ThemeMode _theme = ThemeMode.light;

  ThemeMode get getTheme => _theme;

  void changeTheme(){
    _theme = (isLight()) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    return;
  }

  bool isDark() => (_theme == ThemeMode.dark);
  bool isLight() => (_theme == ThemeMode.light);
}