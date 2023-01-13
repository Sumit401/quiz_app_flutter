import 'package:flutter/material.dart';

import '../registerPage/mainScreen.dart';
import '../reusableWidgets/Responsive.dart';

Widget notUserSignup(context) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: TextButton(
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Register()));
      },
      child: Text("Not a User? Click here SignUp",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: setSize(context, 22))),
    ),
  );
}
