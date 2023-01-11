import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../providers/studentProviders/startQuizProvider.dart';
import '../../../providers/studentProviders/studentProvider.dart';
import '../../../reusableWidgets/Responsive.dart';
import '../../../reusableWidgets/createColor.dart';
import '../resultScreen/mainPage.dart';



Widget submitButtonPageView(context, pageController, answers, snapshot, index) {
  String? userName = FirebaseAuth.instance.currentUser?.email.toString();
  var firestore = FirebaseFirestore.instance.collection("users").doc(userName).collection("answers").get();
  return Consumer2<StartQuizProvider,StudentProvider>(
    builder: (context, quizProvider,studentProvider, child) {
      return  ElevatedButton(
          style: buttonStyle(context),
          onPressed: () async {

            // To check if Index value is greater than -1..... i.e. Answer Selected.................
            if (quizProvider.answerIndex >= 0) {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn);

              // To check for Correct Answer............................................
              if (answers[quizProvider.answerIndex] ==
                  snapshot.data?.docs[index]["Answer1"]) {
                quizProvider.getTotalRight();
              }
              // Reset Index Value to -1 Once Tapped so that no item is selected...............
              quizProvider.resetAnswerValue();

              // IF Quiz is over............. i.e. all page index value matches length of snapshot..............
              if (index + 1 == snapshot.data?.docs.length) {
                int count = await firestore.then((value) => value.size);

                Map<String, String> setValue = {
                  "Faculty Email": studentProvider.facultyEmail,
                  "Quiz Title": studentProvider.quizTitle,
                  "Score" : quizProvider.totalRight.toString(),
                  "Total Questions" : studentProvider.totalQuestions,
                  "Quiz Description" : studentProvider.quizDesc,
                };
                FirebaseFirestore.instance.collection("users").doc(userName).collection("answers").doc("${count+1}").set(setValue);
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
    },
  );
}

buttonStyle(context) {
  return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(hexToColor("#24BA73")),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
          horizontal: setSize(context, 15), vertical: setSize(context, 10))));
}
