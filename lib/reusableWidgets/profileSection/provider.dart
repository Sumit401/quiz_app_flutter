import 'package:flutter/material.dart';

class ProfilePageProvider extends ChangeNotifier {
  String userName = "";
  String userPhone = "";
  String experience = "";
  String about = "";
  String qualification = "";
  String userType = "";

  getExperience(value) {
    experience = value;
    notifyListeners();
  }

  getAbout(value) {
    about = value;
    notifyListeners();
  }

  getQualification(value) {
    qualification = value;
    notifyListeners();
  }

  getUserType(value) {
    userType = value;
    notifyListeners();
  }

  getUserPhone(value) {
    userPhone = value;
    notifyListeners();
  }

  getUserName(value) {
    userName = value;
    notifyListeners();
  }

  clearAllProfileData() {
    userName = "";
    userPhone = "";
    experience = "";
    about = "";
    qualification = "";
    userType = "";
    notifyListeners();
  }
}
