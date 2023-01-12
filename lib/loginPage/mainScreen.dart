import 'package:flutter/material.dart';

import '../reusableWidgets/Responsive.dart';
import 'notUserSignup.dart';
import 'submitButton.dart';
import 'textFields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width:  screenWidth(context),
          height: screenHeight(context),
          decoration: pageDecoration(), //See Below.........
          child: SingleChildScrollView(
            child: bodyContainer(), // See below..........
          )),
    );
  }


  Container bodyContainer() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      width: ResponsiveWidget.isSmallScreen(context)
          ? screenWidth(context)
          : screenWidth(context) / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loginText(context), // See below.........
          textFieldEmail(), // See textFields.dart..................
          textFieldPassword(), // See textFields.dart..................
          submitButton(), // See submitButton.dart..................
          notUserSignup(context), //See notUserSignup.dart..............
        ],
      ),
    );
  }
}



Widget loginText(context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text("Login",
          style: TextStyle(
              fontSize: setSize(context,30), fontWeight: FontWeight.w800, color: Colors.lightGreen,fontStyle: FontStyle.italic)),
    );
  }

  BoxDecoration pageDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(colors: [
      Colors.redAccent,
      Colors.orange,
      Colors.grey,
      Colors.brown,
      Colors.blueAccent,
      Colors.blue,
    ],stops: [0.1,0.2,0.3,0.5,0.9,1],
        begin: Alignment.bottomLeft,end: Alignment.topRight));
  }
