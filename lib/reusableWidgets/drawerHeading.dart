import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Responsive.dart';

drawerHeader(context) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.only(bottom: 20, top: 10),
    width: double.infinity,
    color: Colors.blueGrey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        userImage(),
        userName(context),
        userEmail(context)
      ],
    ),
  );
}

userEmail(context) {
  return Container(
    alignment: Alignment.center,
      child: Text(
        "${FirebaseAuth.instance.currentUser?.email}",
        style: TextStyle(
            fontSize: setSize(context, 17),
            fontWeight: FontWeight.w500,
            color: Colors.white),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ));
}

userName(context) {
  return Container(
    margin: EdgeInsets.only(bottom: 5),
    alignment: Alignment.center,
      child: Text(
        "${FirebaseAuth.instance.currentUser?.displayName}",
        style: TextStyle(
            fontSize: setSize(context, 20),
            fontWeight: FontWeight.bold,
            color: Colors.white),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ));
}

userImage() {
  return Container(
    margin: EdgeInsets.only(top: 50, bottom: 10),
    child: Image.asset(
      "assets/images/user_img.png",
      height: 100,
      width: 100,
    ),
  );
}