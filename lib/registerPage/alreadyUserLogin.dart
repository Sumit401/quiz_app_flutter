import 'package:flutter/material.dart';

import '../loginPage/mainScreen.dart';
import '../reusableWidgets/Responsive.dart';

Widget alreadyUserLogin(context) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: TextButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: Text("Already a User? Click here Login.",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: setSize(context, 20))),
    ),
  );
}
