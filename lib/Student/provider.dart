import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier{

  String facultyID="";


  void setFacultyEmail(value){
    facultyID=value;
    notifyListeners();
  }

}