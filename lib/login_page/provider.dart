import 'package:flutter/material.dart';

class LoginPageProvider extends ChangeNotifier{
  String password="";
  String email="";

  void emailNotifier(index){
    email=index;
    notifyListeners();
  }
  void passwordNotifier(index){
    password=index;
    notifyListeners();
  }
}