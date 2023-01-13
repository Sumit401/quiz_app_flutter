import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  String facultyEmail = "";
  String difficultyLevel = "";
  String totalQuestions = "";
  String quizTitle = "";
  String quizID = "";
  String quizDesc = "";
  String facultyName = "";

  void setFacultyEmail(value) {
    facultyEmail = value;
    notifyListeners();
  }

  void setFacultyName(value) {
    facultyName = value;
    notifyListeners();
  }

  void getDifficultyLevel(value) {
    difficultyLevel = value;
    notifyListeners();
  }

  void getTotalQuestions(value) {
    totalQuestions = value;
    notifyListeners();
  }

  void getQuizTitle(value) {
    quizTitle = value;
    notifyListeners();
  }

  void getQuizDescription(value) {
    quizDesc = value;
    notifyListeners();
  }

  void getQuizID(value) {
    quizID = value;
    notifyListeners();
  }
}
