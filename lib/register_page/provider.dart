import 'package:flutter/material.dart';

class RegisterPageProvider with ChangeNotifier{

  int radioForStudentFaculty = 0;
  int radioCourseType = 0;
  String name = "";
  String email = "";
  String password = "";

  void changeStudentFacultyValue(value){
    radioForStudentFaculty=value;
    notifyListeners();
  }

  void changeCourseType(value){
    radioCourseType=value;
    notifyListeners();
  }
  void nameController(value){
    if(value!="") {
      name=value;
      notifyListeners();
    }

  }
  void emailController(value){
    email=value;
    notifyListeners();
  }
  void passwordController(value){
    password=value;
    notifyListeners();
  }
}