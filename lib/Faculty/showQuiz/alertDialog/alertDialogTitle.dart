import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';

Container titleOfAlertDialog(context, index, snapshot) {
  String quizTitle = snapshot.data.docs[index]['Quiz Title'];
  String quizDesc = snapshot.data.docs[index]['Quiz Description'];
  String difficulty = snapshot.data.docs[index]['Difficulty'];
  String totalQues = snapshot.data.docs[index]['Total Questions'].toString();

  return Container(
    padding: const EdgeInsets.all(10),
    width: screenWidth(context) * 0.75,
    child: Column(
      children: [
        quizTitleContainer(quizTitle, context),
        descText(context),
        quizDescCont(context, quizDesc),
        quizDifficultyCont(context, difficulty),
        totalQuesCont(context, totalQues),
      ],
    ),
  );
}

descText(context) {
  return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Text("Description: ",
          style: TextStyle(
              fontSize: setSize(context, 18), fontWeight: FontWeight.w600)));
}

totalQuesCont(context, String totalQues) {
  return Container(
      child: Text("Total Questions : $totalQues",
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: TextStyle(
              fontSize: setSize(context, 18), fontWeight: FontWeight.w600)));
}

quizDifficultyCont(context, String difficulty) {
  return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text("Difficulty : $difficulty",
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: TextStyle(
              fontSize: setSize(context, 18), fontWeight: FontWeight.w600)));
}

quizDescCont(context, quizDesc) {
  return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(quizDesc,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: TextStyle(
              fontSize: setSize(context, 18), fontWeight: FontWeight.w400)));
}

quizTitleContainer(quizTitle, context) {
  return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(quizTitle,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: TextStyle(
              fontSize: setSize(context, 20), fontWeight: FontWeight.w800)));
}
