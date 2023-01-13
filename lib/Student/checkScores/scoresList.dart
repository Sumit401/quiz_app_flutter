import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import 'dialogBox.dart';

Widget scoresList(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
    int index, BuildContext context) {
  double marks = int.parse(snapshot.data?.docs[index]["Score"]) /
      int.parse(snapshot.data?.docs[index]["Total Questions"]);
  String quizTitle = snapshot.data?.docs[index]["Quiz Title"];
  String quizDesc = snapshot.data?.docs[index]["Quiz Description"];
  String facName = snapshot.data?.docs[index]["Faculty Name"];
  String score = snapshot.data?.docs[index]["Score"];
  String totalQues = snapshot.data?.docs[index]["Total Questions"];

  return InkWell(
    child: Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(width: 0.5)),
      margin: EdgeInsets.symmetric(
          horizontal: setSize(context, 15), vertical: setSize(context, 10)),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(setSize(context, 15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                quizTitleContainer(context, quizTitle),
                quizDescContainer(context, quizDesc),
                quizAssignedContainer(context),
                quizFacName(context, facName),
                quizScore(context, score, totalQues),
                resultWidget(context, marks),
              ],
            ),
          ),
        ),
      ),
    ),
    onTap: () {
      dialogBoxShow(snapshot, context, index, marks);
    },
  );
}

resultWidget(BuildContext context, marks) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Result : ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: setSize(context, 18))),
      Text(marks >= 0.5 ? "Pass" : "Fail",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: setSize(context, 18),
              color: marks >= 0.5 ? Colors.green : Colors.red,
              fontWeight: FontWeight.w600)),
    ],
  );
}

quizScore(BuildContext context, score, totalQues) {
  return Container(
    margin: EdgeInsets.only(bottom: setSize(context, 12)),
    child: Text("Your Score : $score / $totalQues",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: setSize(context, 18))),
  );
}

quizFacName(BuildContext context, String facName) {
  return Container(
    margin: EdgeInsets.only(bottom: setSize(context, 20)),
    child: Text(facName,
        style: TextStyle(
            fontSize: setSize(context, 20), fontWeight: FontWeight.w700),
        textAlign: TextAlign.center),
  );
}

quizAssignedContainer(context) {
  return Text("Assigned By : ",
      style: TextStyle(fontSize: setSize(context, 20)),
      textAlign: TextAlign.center);
}

quizDescContainer(context, String quizDesc) {
  return Container(
    margin: EdgeInsets.only(bottom: setSize(context, 20)),
    child: Text(quizDesc,
        style: TextStyle(fontSize: setSize(context, 14)),
        textAlign: TextAlign.center),
  );
}

quizTitleContainer(context, quizTitle) {
  return Container(
      margin: EdgeInsets.only(bottom: setSize(context, 20)),
      child: Text(quizTitle,
          style: TextStyle(fontSize: setSize(context, 20)),
          textAlign: TextAlign.center));
}
