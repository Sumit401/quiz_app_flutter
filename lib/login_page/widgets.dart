import 'package:flutter/material.dart';
import 'package:flutter_project/register_page/mainScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget notUserSignup(context) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text("Not a User? Click here SignUp",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
    ),
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Register()));
    },
  );
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



/*

Widget toggleButtons() {
  List<bool> selections = [true, false];
  return Consumer<ToggleButtonProvider>(
    builder: (context, value, child) {
      return ToggleButtons(
          borderRadius: BorderRadius.circular(20),
          borderWidth: 2,
          fillColor: Colors.green,
          selectedColor: Colors.green,
          splashColor: Colors.lightGreen,
          selectedBorderColor: Colors.white,
          borderColor: Colors.white,
          onPressed: (newindex) {
            value.checkIndex(newindex);
            if (value.buttonIndex == 0) {
              selections[0] = true;
              selections[1] = false;
            } else {
              selections[0] = false;
              selections[1] = true;
            }
          },
          isSelected: selections,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const Text("Student",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15))),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const Text("Faculty",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15)))
          ]);
    },
  );
}*/
