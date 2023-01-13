import 'package:flutter/material.dart';

class CreateQuizProvider extends ChangeNotifier {
  int radioForQuizDifficulty = 0;
  String stringForQuizDifficulty = "Easy";
  String quizTitle = "";
  String quizDesc = "";

  String questionInfo = "";
  String option1 = "";
  String option2 = "";
  String option3 = "";
  String option4 = "";

  List<Map<String, String>> list = [];

  void getQuizTitle(String title) {
    quizTitle = title;
    notifyListeners();
  }

  void getQuizDesc(String desc) {
    quizDesc = desc;
    notifyListeners();
  }

  void getQuestionInfo(String quest) {
    questionInfo = quest;
    notifyListeners();
  }

  void getOption1(String opt1) {
    option1 = opt1;
    notifyListeners();
  }

  void getOption2(String opt2) {
    option2 = opt2;
    notifyListeners();
  }

  void getOption3(String opt3) {
    option3 = opt3;
    notifyListeners();
  }

  void getOption4(String opt4) {
    option4 = opt4;
    notifyListeners();
  }

  void getQuizDifficulty(difficultyValue) {
    if (difficultyValue == 0) {
      radioForQuizDifficulty = 0;
      stringForQuizDifficulty = "Easy";
    } else if (difficultyValue == 1) {
      radioForQuizDifficulty = difficultyValue;
      stringForQuizDifficulty = "Medium";
    } else if (difficultyValue == 2) {
      radioForQuizDifficulty = difficultyValue;
      stringForQuizDifficulty = "Difficult";
    }
    notifyListeners();
  }

  void setDataToList() {
    Map<String, String> value = {
      "Question": questionInfo,
      "Answer1": option1,
      "Answer2": option2,
      "Answer3": option3,
      "Answer4": option4
    };
    list.add(value);
    // Clear the values once added to list.......................
    questionInfo = "";
    option1 = "";
    option2 = "";
    option3 = "";
    option4 = "";
    notifyListeners();
  }

  void deleteData(index) {
    list.removeAt(index);
    notifyListeners();
  }

  void clearProviderValue() {
    list.clear();
    quizTitle = "";
    quizDesc = "";
    radioForQuizDifficulty = 0;
    stringForQuizDifficulty = "Easy";
    notifyListeners();
  }
}
