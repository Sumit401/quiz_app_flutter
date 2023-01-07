import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../loginPage/mainScreen.dart';
import '../reusableWidgets/alertDialogs/alertDialogLoading.dart';
import '../reusableWidgets/switchCaseLoginError.dart';
import '../reusableWidgets/toastWidget.dart';
import 'provider.dart';

Widget buttonSubmit() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return buttonContent(providerValue,context);
    },
  ) ;
}

Widget buttonContent(providerValue, context) {
  return ElevatedButton(
      style: const ButtonStyle(elevation: MaterialStatePropertyAll(20)),
      onPressed: () async {
        if(providerValue.email.trim()!="" && providerValue.password !="" && providerValue.name.trim() !="") {
          FocusManager.instance.primaryFocus?.unfocus(); // To remove Keyboard
          showAlertDialog(context); // To show Alert Loading Dialog Box

          setDataToFirebase(providerValue, context); // Set data to Firebase See Below.............

        }else{
          long_flutter_toast("Please fill out all fields to Continue");
        }
      },
      child: const Text(
        "Submit",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}

// Set data to Firebase.......................................
Future<void> setDataToFirebase(providerValue, context) async {
  try {

    // Create user in Firebase with email and password................
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: providerValue.email.trim(),
        password: providerValue.password);

    // update display name in Firebase..........................
    result.user?.updateDisplayName(providerValue.name.trim());

    // Check if faculty or Student
    String type="";
    providerValue.radioForStudentFaculty.toString()=="1" ? type="experience" : null;

    // Map user data ................
    Map<String, String> userdata = {
      "name": providerValue.name.trim(),
      "userType": providerValue.radioForStudentFaculty.toString(),
      "about" : "" ,
      type : "",
      "qualification" : ""
    };
    // Set user data to collection in Firebase...........
    FirebaseFirestore.instance.collection("users").doc(
        providerValue.email).set(userdata);

    long_flutter_toast("Successfully Registered");
    // Navigate to Login Page...............
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));

    // Delete Provider value..................
    providerValue.deletePassword();
    providerValue.deleteEmail();
    providerValue.deleteName();

  } catch (e) {
    // Catch error display toast...........
    Navigator.pop(context);
    switchCaseError(e);
  }
}

