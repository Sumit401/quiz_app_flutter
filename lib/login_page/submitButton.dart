import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Faculty/mainScreen.dart';
import '../Student/mainScreen.dart';
import '../reusableWidgets/alertDialogLoading.dart';
import '../reusableWidgets/switchCaseLoginError.dart';
import '../reusableWidgets/toastWidget.dart';
import 'provider.dart';

Widget submitButton() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    // Submit Button Login
    child: Consumer<LoginPageProvider>(
      builder: (context, providerValue, child) {
        return ElevatedButton(
          onPressed: () async{
        if(providerValue.email.trim()!="" && providerValue.password !="") {
          FocusManager.instance.primaryFocus?.unfocus();
          showAlertDialog(context);
          SharedPreferences sharedPreferences = await SharedPreferences
              .getInstance();
          try {
            UserCredential firebaseAuth = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                email: providerValue.email.trim(),
                password: providerValue.password);
            //sharedPreferences.setString("userName", firebaseAuth.user!.displayName.toString());
            //sharedPreferences.setString("userEmail", firebaseAuth.user!.email.toString());
            long_flutter_toast("Login Successful");
            FirebaseFirestore.instance.collection("users").doc(
                providerValue.email.trim()).get()
                .then((value1) =>
                value1.data()?.forEach((key, value) {
                  if (key == "userType") {
                    value == "0" ? { Navigator.pop(context), // If Student
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => StudentHome(),))
                    }
                        : { Navigator.pop(context), // If Faculty
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => FacultyHome(),))
                    };
                    sharedPreferences.setString("userType", value == "0"
                        ? "Student"
                        : "Faculty");
                  }
                  providerValue.deleteEmail();
                  providerValue.deletePassword();
                  //print(firebaseAuth.user?.providerData.toString());
                        }));
              } catch (e) {
                Navigator.pop(context);
                switchCaseError(e);
              }
            }else{
          long_flutter_toast("Please fill out all fields to Continue");
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



