
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Responsive.dart';

Widget userEmailContent(context) {
  String? userEmail = FirebaseAuth.instance.currentUser?.email.toString();
  return Container(
    margin: const EdgeInsets.only(top: 5),
    alignment: Alignment.center,
    child: textView(context, userEmail),
  );
}

Widget userNameContent(context) {
  String? userName = FirebaseAuth.instance.currentUser?.displayName.toString();
  return Container(
      margin: EdgeInsets.only(
          bottom: setSize(context, 7), top: setSize(context, 20)),
      alignment: Alignment.center,
      child: textView(context, userName));
}

Text textView(context, value) {
  return Text(
    value,
    style: textStyleName(context),
    textAlign: TextAlign.center,
  );
}

TextStyle textStyleName(context) {
  return TextStyle(
      fontSize: setSize(context, 20),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      overflow: TextOverflow.ellipsis);
}

