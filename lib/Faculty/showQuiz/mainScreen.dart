import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/createColor.dart';
import 'quizDataCard.dart';

// Declaration of Firebase

Container showQuiz(context) {
  String? email = FirebaseAuth.instance.currentUser?.email.toString();
  var firestoreSnapshots = FirebaseFirestore.instance
      .collection("users")
      .doc(email)
      .collection("questions")
      .snapshots();

  return Container(
    alignment: Alignment.topCenter,
    child: StreamBuilder(
      stream: firestoreSnapshots,
      builder: (context, snapshot) {
        if ((snapshot.data?.docs.length).toString() == "null" ||
            (snapshot.data?.docs.length).toString() == "0") {
          return Container(
              alignment: Alignment.center,
              child: Text(
                "You have not Created a Quiz\n Create one to Display Here!",
                style: TextStyle(
                    height: 1.5,
                    fontSize: setSize(context, 24),
                    fontWeight: FontWeight.bold,
                    color: hexToColor("#263300"),
                    overflow: TextOverflow.visible,
                    wordSpacing: 2,
                    letterSpacing: 0.4),
                textAlign: TextAlign.center,
              ));
        } else {
          return  ResponsiveWidget.isSmallScreen(context)
              ? ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return SizedBox(
                        child: showQuizData(context, snapshot, index));
                  },
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: ResponsiveWidget.isMediumScreen(context) ? 2 : 3,
                mainAxisExtent: screenHeight(context) / 2.5),
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return SizedBox(
                        child: showQuizData(context, snapshot, index));
                  },
                );
        }
      },
    ),
  );
}
