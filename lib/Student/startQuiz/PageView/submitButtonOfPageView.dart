import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Student/startQuiz/provider.dart';
import 'package:flutter_project/Student/startQuiz/resultSummary/mainPage.dart';

import '../../../reusableWidgets/Responsive.dart';
import '../../../reusableWidgets/createColor.dart';



Widget submitButtonPageView(context, pageController, answers, snapshot, index,
    StartQuizProvider providerValue) {
  String? userName = FirebaseAuth.instance.currentUser?.email.toString();
  var firestore = FirebaseFirestore.instance.collection("users").doc(userName).collection("answers").get();
  return ElevatedButton(
      style: buttonStyle(context),
      onPressed: () async {

        // To check if Index value is greater than -1..... i.e. Answer Selected.................
        if (providerValue.answerIndex >= 0) {
          pageController.nextPage(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeIn);

          // To check for Correct Answer............................................
          if (answers[providerValue.answerIndex] ==
              snapshot.data?.docs[index]["Answer1"]) {
            providerValue.getTotalRight();
          }
          // Reset Index Value to -1 Once Tapped so that no item is selected...............
          providerValue.resetAnswerValue();

          // IF Quiz is over............. i.e. all page index value matches length of snapshot..............
          if (index + 1 == snapshot.data?.docs.length) {
           int count = await firestore.then((value) => value.size);
           print(count);
            Navigator.pop(context);
            Navigator.push( context, MaterialPageRoute(
                builder: (context) => const ResultSummary()));
          }
        }
      },
      child: Text(
        "Submit",
        style: TextStyle(fontSize: setSize(context, 20)),
      ));
}

buttonStyle(context) {
  return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(hexToColor("#24BA73")),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
          horizontal: setSize(context, 15), vertical: setSize(context, 10))));
}
