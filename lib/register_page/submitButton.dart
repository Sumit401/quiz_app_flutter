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
    builder: (context, value, child) {
      return ElevatedButton(
          style: const ButtonStyle(elevation: MaterialStatePropertyAll(20)),
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus(); // To remove Keyboard
            showAlertDialog(context); // To show Alert Loading Dialog Box
            try {
              UserCredential result = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                  email: value.email,
                  password: value.password);
              result.user?.updateDisplayName(value.name);

              Map<String,String> userdata={
                "name":value.name,
                "userType" : value.radioForStudentFaculty.toString(),
                "userCourse": value.radioCourseType.toString(),
              };
              FirebaseFirestore.instance.collection("users").doc(value.email).set(userdata);
              long_flutter_toast("Successfully Registered");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));

            } catch(e){
              Navigator.pop(context);
              switchcase_error(e);
            }
          },
          child: const Text(
            "Submit",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ));
    },
  ) ;
}

