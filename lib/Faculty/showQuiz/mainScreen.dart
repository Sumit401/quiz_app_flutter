
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';
import 'quizDataCard.dart';

// Declaration of Firebase

Container showQuiz(context)  {
  String? email = FirebaseAuth.instance.currentUser?.email.toString();
  var firestoreSnapshots =FirebaseFirestore.instance.collection("users").doc(email).collection("questions").snapshots();

  return Container(
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: hexToColor("#263300"),
                    overflow: TextOverflow.visible,
                    wordSpacing: 2,
                    letterSpacing: 0.4),
                textAlign: TextAlign.center,
              ));
        }else {
          return ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (context, index) {

              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return showQuizData(context, snapshot, index);

          },
        );
        }
      },
    ),
  );
}
