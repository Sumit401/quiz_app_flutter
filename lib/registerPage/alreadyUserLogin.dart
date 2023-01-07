import 'package:flutter/material.dart';

import '../loginPage/mainScreen.dart';
import '../reusableWidgets/Responsive.dart';




Widget alreadyUserLogin(context) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text("Not a User? Click here SignUp",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: setFontSize(context,20))),
    ),
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    },
  );
}
