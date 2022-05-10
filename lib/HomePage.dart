import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ge400mobileapp/globals.dart';

class HomePage extends ChangeNotifier{
  get isVisible => isVisible;
  bool _isVisible = false;
  set isVisible(value){
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;
  void isValidEmail(String input){
    if(input = Global.validEmail.first){
      _isValid  = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }
}
