import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../loginPage/mainScreen.dart';
import '../Responsive.dart';
import '../profileSection/provider.dart';

AlertDialog alertDialogSignOut(context) {
  return AlertDialog(
    title: Text("Do You want to Logout ?",
        style: TextStyle(fontSize: setSize(context, 20))),
    elevation: 10,
    actions: [
      noPressed(context),
      yesPressed(context),
    ],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}

Widget yesPressed(context) {
  return Consumer<ProfilePageProvider>(
    builder: (context, proValue, child) {
      return TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            SharedPreferences sharedPreference =
                await SharedPreferences.getInstance();
            await sharedPreference.clear();
            proValue.clearAllProfileData();
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: Text("Yes", style: TextStyle(fontSize: setSize(context, 22))));
    },
  );
}

Widget noPressed(context) {
  return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text("No", style: TextStyle(fontSize: setSize(context, 22))));
}
