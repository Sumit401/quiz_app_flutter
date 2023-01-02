

import 'package:flutter/material.dart';

class ProviderToggleType extends ChangeNotifier{

  int selectedRadio = 0;

  void changeRadioValue(value){
    selectedRadio=value;
    notifyListeners();
  }
}