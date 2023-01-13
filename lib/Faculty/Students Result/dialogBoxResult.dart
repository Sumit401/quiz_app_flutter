import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/createColor.dart';

void dialogBoxResult(context, String? docID, String studName) {
  var firebaseStore = FirebaseFirestore.instance
      .collection("users")
      .doc(docID)
      .collection("answers")
      .snapshots();
  String? facEmail = FirebaseAuth.instance.currentUser?.email;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        icon: const Icon(FontAwesomeIcons.chartLine, size: 30),
        title: Text(studName, textAlign: TextAlign.center),
        scrollable: true,
        content: content(context, facEmail, firebaseStore),
      );
    },
  );
}

content(
  context,
  facEmail,
  Stream<QuerySnapshot<Map<String, dynamic>>> firebaseStore,
) {
  return SizedBox(
    height: screenHeight(context) / 1.8,
    width: screenWidth(context),
    child: StreamBuilder(
      stream: firebaseStore,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        if ((snapshot.data?.docs.length).toString() == "null" ||
            (snapshot.data?.docs.length).toString() == "0") {
          return Container(
              alignment: Alignment.center,
              child: Text(
                "Student has not Participated in your Quiz yet.\nPlease, Check back Later.!",
                style: TextStyle(
                    height: 1.5,
                    fontSize: setSize(context, 22),
                    fontWeight: FontWeight.bold,
                    color: hexToColor("#263300"),
                    overflow: TextOverflow.visible,
                    wordSpacing: 2,
                    letterSpacing: 0.4),
                textAlign: TextAlign.center,
              ));
        } else {
          return listView(snapshot, facEmail);
        }
      },
    ),
  );
}

listView(snapshot, facEmail) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: snapshot.data?.docs.length,
    itemBuilder: (context, index) {
      if (snapshot.data?.docs[index]["Faculty Email"] == facEmail) {
        // Get Data From Snapshots................
        double result = int.parse(snapshot.data?.docs[index]['Score']) /
            int.parse(snapshot.data?.docs[index]['Total Questions']);
        String score = snapshot.data?.docs[index]['Score'];
        String totalQues = snapshot.data?.docs[index]['Total Questions'];
        String quizTitle = snapshot.data?.docs[index]["Quiz Title"];

        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(quizTitle),
              Text("Score : $score / $totalQues"),
              Text(result > 0.5 ? "Passed" : "Failed",
                  style: TextStyle(
                      color: result > 0.5 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: setSize(context, 18))),
              Container(
                height: 1,
                color: Colors.black,
              )
            ],
          ),
        );
      }
      return Container();
    },
  );
}
