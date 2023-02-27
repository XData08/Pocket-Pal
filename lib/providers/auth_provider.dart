import "package:flutter/material.dart";


class AuthProvider with ChangeNotifier {
  
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // sign up = -1 ; sign in = 1 ; forgot password = 0
  int _currentPage = -1;
  bool _isObsecure = true;

  GlobalKey<FormState> get getFormKey => _formKey;
  int get getCurrentPage => _currentPage;
  bool get getIsObsecure => _isObsecure;


  void changePage(int value){
    _formKey = GlobalKey<FormState>();
    _currentPage = value; 
    _isObsecure = true;

    _containsCharacter = false;
    _containsUpperLower = false;
    _containsNumerics = false;
    _containsSymbols = false;
    notifyListeners();
    return;
  }

  void changeObsecure(){
    _isObsecure = !_isObsecure;
    notifyListeners();
    return;
  }

  bool _containsCharacter = false;
  bool _containsUpperLower = false;
  bool _containsNumerics = false; 
  bool _containsSymbols = false;

  bool get getContainsCharacter => _containsCharacter;
  bool get getContainsUpperLower => _containsUpperLower;
  bool get getContainsNumerics => _containsNumerics;
  bool get getContainsSymbols => _containsSymbols;

  void setContainsCharacter(bool value){
    _containsCharacter = value;
    notifyListeners();
    return;
  }

  void setContainsUpperLower(bool value) {
    _containsUpperLower = value;
    notifyListeners();
    return;
  }

  void setContainsNumerics(bool value) {
    _containsNumerics = value;
    notifyListeners();
    return;
  }

  void setContainsSymbol(bool value){
    _containsSymbols = value;
    notifyListeners();
    return;
  }

}