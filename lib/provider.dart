import 'package:flutter/material.dart';

class ToggleButtonProvider extends ChangeNotifier{
  int buttonIndex=0;

  void checkIndex(int indexes){
    buttonIndex=indexes;
    notifyListeners();
  }

}