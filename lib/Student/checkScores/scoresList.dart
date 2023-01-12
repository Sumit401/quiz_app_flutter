import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import 'dialogBox.dart';

Widget scoresList(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
    int index, BuildContext context) {
  double score = int.parse(snapshot.data?.docs[index]["Score"]) /
      int.parse(snapshot.data?.docs[index]["Total Questions"]);

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
                Container(
                    margin: EdgeInsets.only(bottom: setSize(context, 20)),
                    child: Text(snapshot.data?.docs[index]["Quiz Title"],
                        style: TextStyle(fontSize: setSize(context, 20)),
                        textAlign: TextAlign.center)),
                Container(
                  margin: EdgeInsets.only(bottom: setSize(context, 20)),
                  child: Text(snapshot.data?.docs[index]["Quiz Description"],
                      style: TextStyle(fontSize: setSize(context, 14)),
                      textAlign: TextAlign.center),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: setSize(context, 20)),
                      child: Text("Assigned By : ",
                          style: TextStyle(fontSize: setSize(context, 20)),
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: setSize(context, 20)),
                      child: Text(snapshot.data?.docs[index]["Faculty Name"],
                          style: TextStyle(
                              fontSize: setSize(context, 20),
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
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
          ),
        ),
      ),
    ),
    onTap: () {
      dialogBoxShow(snapshot, context, index, score);
    },
  );
}
