import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_page/mainScreen.dart';

AlertDialog alertDialogSignout(context) {
  return AlertDialog(
    title: const Text("Do You want to Logout ?"),
    elevation: 10,
    actions: [
      TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("No", style: TextStyle(fontSize: 20))),
      TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            SharedPreferences sharedPreference =
            await SharedPreferences.getInstance();
            await sharedPreference.clear();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: const Text("Yes", style: TextStyle(fontSize: 20)))
    ],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
