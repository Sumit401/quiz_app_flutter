import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerProvider extends ChangeNotifier {
  int timer = 0;

  var timerdata;

  void startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer_data) {
        timer--;
        timerdata = timer_data;
        notifyListeners();
      },
    );
    notifyListeners();
  }

  void setTimerData(value) {
    timer = value;
    notifyListeners();
  }

  void cancelTimer() {
    timerdata.cancel();
  }
}
