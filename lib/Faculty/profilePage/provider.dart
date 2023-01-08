import 'package:flutter/material.dart';

class FacultyProfilePageProvider extends ChangeNotifier{

  String experience = "";
  String about = "";
  String qualification="";

  getExperience(value){
    experience = value;
    notifyListeners();
  }
  getAbout(value){
    about = value;
    notifyListeners();
  }
  getQualification(value){
    qualification = value;
    notifyListeners();
  }

}