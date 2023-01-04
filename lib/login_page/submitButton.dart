import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Faculty/mainScreen.dart';
import '../reusableWidgets/alertDialogLoading.dart';
import '../reusableWidgets/toastWidget.dart';
import 'provider.dart';

Widget submitButton() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    // Submit Button Login
    child: Consumer<LoginPageProvider>(
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: () async{
            FocusManager.instance.primaryFocus?.unfocus();
            showAlertDialog(context);
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            try{
              UserCredential firebaseAuth = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: value.email, password: value.password);
              //sharedPreferences.setString("userName", firebaseAuth.user!.displayName.toString());
              //sharedPreferences.setString("userEmail", firebaseAuth.user!.email.toString());
              FirebaseFirestore.instance.collection("users").doc(value.email).get()
                  .then((value1) => value1.data()!.forEach((key, value) {
                if (key == "userCourse") {
                  sharedPreferences.setString("userCourse", value=="0" ? "Science" :"Commerce");
                } else if (key == "userType") {
                  sharedPreferences.setString("userType", value=="0" ? "Student" : "Faculty");
                }
              }));
              long_flutter_toast("Login Successful");
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FacultyHome(),));
            }catch(e){
              Navigator.pop(context);
              switchCaseError(e);
            }

          },
          style: submitButtonStyle(),
          child: const Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        );
      },
    ),
  );
}

ButtonStyle submitButtonStyle(){
  return  ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: const MaterialStatePropertyAll(Colors.blueAccent),
      elevation: const MaterialStatePropertyAll(10),
      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 15,vertical: 5)),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
}



switchCaseError(e){
  switch (e.code) {
    case "wrong-password":
      long_flutter_toast("Password Incorrect");
      break;
    case "user-not-found":
      long_flutter_toast("User Not Registered");
      break;
    default:
      long_flutter_toast("An undefined Error happened.");
  }
}

