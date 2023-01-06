import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../reusableWidgets/alertDialogLoading.dart';
import '../login_page/mainScreen.dart';
import '../reusableWidgets/switchCaseLoginError.dart';
import '../reusableWidgets/toastWidget.dart';
import 'provider.dart';

Widget buttonSubmit() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return ElevatedButton(
          style: const ButtonStyle(elevation: MaterialStatePropertyAll(20)),
          onPressed: () async {
            if(providerValue.email.trim()!="" && providerValue.password !="" && providerValue.name.trim() !="") {
              FocusManager.instance.primaryFocus
                  ?.unfocus(); // To remove Keyboard
              showAlertDialog(context); // To show Alert Loading Dialog Box
              try {
                UserCredential result = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                    email: providerValue.email.trim(),
                    password: providerValue.password);
                result.user?.updateDisplayName(providerValue.name.trim());

                Map<String, String> userdata = {
                  "name": providerValue.name.trim(),
                  "userType": providerValue.radioForStudentFaculty.toString(),
                  /*"userCourse": value.radioCourseType.toString(),*/
                };
                FirebaseFirestore.instance.collection("users").doc(
                    providerValue.email).set(userdata);
                long_flutter_toast("Successfully Registered");
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                providerValue.deletePassword();
                providerValue.deleteEmail();
                providerValue.deleteName();
              } catch (e) {
                Navigator.pop(context);
                switchCaseError(e);
              }
            }else{
              long_flutter_toast("Please fill out all fields to Continue");
            }
          },
          child: const Text(
            "Submit",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ));
    },
  ) ;
}

