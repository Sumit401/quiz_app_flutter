import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Responsive.dart';
import '../provider.dart';

dialogBoxUpdateCurrentUserInfo(context, userInfo, infoType) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(infoType),
        content: contentOfAlertBox(context, userInfo, infoType),
        actions: [buttonForSave(userInfo, infoType)],
        actionsPadding: EdgeInsets.only(
            right: setSize(context, 20), bottom: setSize(context, 20)),
      );
    },
  );
}

// Content of Alert Dialog Box..................
contentOfAlertBox(context, userInfo, infoType) {
  return SizedBox(
      width: screenWidth(context),
      child: Consumer<ProfilePageProvider>(
          builder: (context, providerValue, child) {
        return TextFormField(
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          initialValue: providerValue.userName,
          onChanged: (value) {
            providerValue.getUserName(value);
          },
        );
      }));
}

// Button to save changes........................
buttonForSave(userInfo, infoType) {
  return Consumer<ProfilePageProvider>(
    builder: (context, proValue, child) {
      return ElevatedButton(
          onPressed: () {
            if (infoType == "User Name") {
              Map<String, String> updatedData = {
                "name": proValue.userName,
              };
              FirebaseAuth.instance.currentUser
                  ?.updateDisplayName(proValue.userName);
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(userInfo.email)
                  .update(updatedData);
            }

            Navigator.pop(context);
          },
          child: const Text("Save"));
    },
  );
}
