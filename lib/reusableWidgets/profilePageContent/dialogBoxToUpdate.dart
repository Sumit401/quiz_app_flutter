import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Responsive.dart';
import '../profileSection/provider.dart';

createDialogBoxUpdate(context, providerValue, updateValue) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(updateValue),
        content: contentOfAlertBox(context, providerValue, updateValue),
        actions: [buttonForSave()],
        actionsPadding: EdgeInsets.only(
            right: setSize(context, 20), bottom: setSize(context, 20)),
      );
    },
  );
}

Widget contentOfAlertBox(context, providerValue, updateValue) {
  return SizedBox(
    width: screenWidth(context),
    child: TextFormField(
      initialValue: updateValue == "Your Description"
          ? providerValue.about
          : updateValue == "Experience"
              ? providerValue.experience
              : providerValue.qualification,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      maxLines: 10,
      minLines: 1,
      onChanged: (value) {
        updateValue == "Your Description"
            ? providerValue.getAbout(value)
            : updateValue == "Experience"
                ? providerValue.getExperience(value)
                : providerValue.getQualification(value);
      },
    ),
  );
}

Widget buttonForSave() {
  return Consumer<ProfilePageProvider>(
    builder: (context, proValue, child) {
      return ElevatedButton(onPressed: () {
        String? email = FirebaseAuth.instance.currentUser?.email.toString();

        Map<String,String> updatedData= {
          "about": proValue.about,
          "experience":proValue.experience,
          "qualification":proValue.qualification
        };
        FirebaseFirestore.instance.collection("users").doc(email).update(updatedData);
        Navigator.pop(context);
      }, child: const Text("Save"));
    },
  );
}