import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerProvider extends ChangeNotifier{
  int timer = 0 ;

  void startTimer(){
    Timer.periodic(Duration(seconds: 1),(timerdata) {
      timer--;
      notifyListeners();
    },);
    notifyListeners();
  }
  void setTimerData(value){
    timer=value;
    notifyListeners();
  }
}