import 'package:flutter/material.dart';

class StartQuizProvider extends ChangeNotifier {
  int answerIndex = -1;
  int totalRight = 0;

  void getAnswerID(value) {
    answerIndex = value;
    notifyListeners();
  }

  void resetAnswerValue() {
    answerIndex = -1;
    notifyListeners();
  }

  void getTotalRight() {
    totalRight = totalRight + 1;
    notifyListeners();
  }

  void resetTotalCorrectAns() {
    totalRight = 0;
    notifyListeners();
  }
}
