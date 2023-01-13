import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';

dialogBoxShow(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
    context, index, score) {
  return showDialog(
    context: context,
    builder: (context) {
      String title = snapshot.data?.docs[index]["Quiz Title"];
      String desc = snapshot.data?.docs[index]["Quiz Description"];
      String faculty = snapshot.data?.docs[index]["Faculty Name"];
      String marks = snapshot.data?.docs[index]["Score"] +
          "/" +
          snapshot.data?.docs[index]["Total Questions"];
      String result = score > 0.4 ? "Passed" : "Failed";

      return AlertDialog(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        scrollable: true,
        alignment: Alignment.center,
        title: Text(snapshot.data?.docs[index]["Quiz Title"],
            style: TextStyle(
                fontSize: setSize(context, 18), fontWeight: FontWeight.w500),
            textAlign: TextAlign.center),
        icon: Image.network(
            "https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=$title\n\nDescription: $desc \n\nFaculty Name : $faculty \n\nMarks: $marks \n\nResult: $result"),
        content: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: setSize(context, 12)),
              child: Text(
                  "Your Score : ${snapshot.data?.docs[index]["Score"]} / ${snapshot.data?.docs[index]["Total Questions"]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: setSize(context, 18))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Result : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: setSize(context, 18))),
                Text(score >= 0.5 ? "Pass" : "Fail",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: setSize(context, 18),
                        color: score >= 0.5 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      );
    },
  );
}
