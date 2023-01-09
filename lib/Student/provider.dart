import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier{

  String facultyID="";
  String difficultyLevel = "";
  String totalQuestions = "";
  String quizTitle = "";
  String quizID = "";


  void setFacultyEmail(value){
    facultyID=value;
    notifyListeners();
  }
  void getDifficultyLevel(value){
    difficultyLevel=value;
    notifyListeners();
  }
  void getTotalQuestions(value){
    totalQuestions=value;
    notifyListeners();
  }
  void getQuizTitle(value){
    quizTitle=value;
    notifyListeners();
  }
  void getQuizID(value){
    quizID=value;
    notifyListeners();
  }

}