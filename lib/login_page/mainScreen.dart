import 'package:flutter/material.dart';
import 'package:flutter_project/login_page/widgets.dart';
import 'package:flutter_project/Responsive.dart';

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
          width:  MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: pageDecoration(),
          child: SingleChildScrollView(
            child: Container(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width / 2,
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginText(),
                  //toggleButtons(),
                  textFieldEmail(),
                  textFieldPassword(),
                  submitButton(),
                  notUserSignup(context),
                ],
              ),
            ),
          )),
    );
  }

  Widget loginText() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Text("Login",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.lightGreen,fontStyle: FontStyle.italic)),
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
}
