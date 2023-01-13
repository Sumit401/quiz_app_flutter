import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Faculty/mainScreen.dart';
import '../Student/mainScreen.dart';
import '../providers/loginPageProvider.dart';
import '../reusableWidgets/Responsive.dart';
import '../reusableWidgets/alertDialogs/alertDialogLoading.dart';
import '../reusableWidgets/profileSection/getProfileInfo.dart';
import '../reusableWidgets/profileSection/provider.dart';
import '../reusableWidgets/switchCaseLoginError.dart';
import '../reusableWidgets/toastWidget.dart';

// Login Button Content.....................................
Widget submitButton() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    // Submit Button Login
    child: Consumer<LoginPageProvider>(
      builder: (context, providerValue, child) {
        return buttonContent(providerValue,
            context); // Button Content See below..................
      },
    ),
  );
}

// Button Content...................................................
Widget buttonContent(providerValue, context) {
  return Consumer<ProfilePageProvider>(
    builder: (context, profileProvider, child) {
      return ElevatedButton(
        onPressed: () async {
          if (providerValue.email.trim() != "" &&
              providerValue.password != "") {
            FocusManager.instance.primaryFocus?.unfocus();
            showAlertDialog(context);
            getValueFromFirebase(providerValue, context,
                profileProvider); // firebase Activities see below..........
          } else {
            long_flutter_toast("Please fill out all fields to Continue");
          }
        },
        style: submitButtonStyle(),
        // Button Styling See below..............................
        child: Text("Submit",
            style: TextStyle(
                fontSize: setSize(context, 22), fontWeight: FontWeight.bold)),
      );
    },
  );
}

// Button Styling for above Submit Button
ButtonStyle submitButtonStyle() {
  return ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: const MaterialStatePropertyAll(Colors.blueAccent),
      elevation: const MaterialStatePropertyAll(10),
      padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 5)),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
}

//Function to perform Firebase activities..................................
Future<void> getValueFromFirebase(
    providerValue, context, ProfilePageProvider profileProvider) async {
  // Create shared preference to set data ......................
  //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  try {
    //SignIn with email password.........
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: providerValue.email.trim(), password: providerValue.password);

    /* sharedPreferences.setString("userName", firebaseAuth.user!.displayName.toString());
      sharedPreferences.setString("userEmail", firebaseAuth.user!.email.toString());*/

    // Check if the user is Student or faculty by getting data from Database.............
    FirebaseFirestore.instance
        .collection("users")
        .doc(providerValue.email.trim())
        .get()
        .then((value1) => value1.data()?.forEach((key, value) {
              // Check user type and Navigate see below...................
              checkUserTypeAndNavigate(key, value, context);

              // Delete Provider value..................
              providerValue.deleteEmail();
              providerValue.deletePassword();
            }));
    // Show flutter Toast if login Successful.........
    short_flutter_toast("Login Successful");
    await getProfileInfo(profileProvider);
  } catch (e) {
    // Catch error display toast..........................
    Navigator.pop(context);
    switchCaseError(e); //See Reusable Widget..............
  }
}

// Check user type and Navigate to HomeScreen...........................
void checkUserTypeAndNavigate(key, value, context) {
  // Navigation Check..... if student or Faculty..........................
  if (key == "userType") {
    //Set value to shared preferences..................

    value == "0"
        ? {
            Navigator.pop(context), // If user is Student
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentHome(),
                ))
          }
        : {
            Navigator.pop(context), // If user is Faculty
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FacultyHome(),
                ))
          };
  }
}
