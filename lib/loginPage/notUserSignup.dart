import 'package:flutter/material.dart';
import 'package:flutter_project/reusableWidgets/Responsive.dart';

import '../registerPage/mainScreen.dart';

Widget notUserSignup(context) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text("Not a User? Click here SignUp",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: setSize(context, 22))),
    ),
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Register()));
    },
  );
}