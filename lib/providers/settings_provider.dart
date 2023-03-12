import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";


class SettingsProvider with ChangeNotifier{

  late final SharedPreferences pref;

  SettingsProvider(){
    _init();
  }

  Future<void> _init() async{
    pref = await SharedPreferences.getInstance();
    notifyListeners();
    return;
  }
  

  set setFirstInstall(bool value){
    pref.setBool("firstInstall", value);
    notifyListeners();
  }


  bool get getFirstInstall => pref.getBool("firstInstall") ?? true;
  

  void setDefault() {
    pref.setBool("firstInstall", true);

    notifyListeners(); 
    return;
  }
  
}