import 'package:flutter/material.dart';
import 'package:flutter_project/login_page/mainScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

double screenHeight(context){
  return MediaQuery.of(context).size.height;
}
double screenWidth(context){
  return MediaQuery.of(context).size.width;
}

Future<bool?> long_flutter_toast(String message){
  return(
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0));
}


Widget alreadyUserLogin(context) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text("Not a User? Click here SignUp",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
    ),
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    },
  );
}
