import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/appBar.dart';
import '../../reusableWidgets/createColor.dart';
import 'checkScoreList.dart';

class StudentResult extends StatefulWidget {
  const StudentResult({Key? key}) : super(key: key);

  @override
  State<StudentResult> createState() => _StudentResultState();
}

class _StudentResultState extends State<StudentResult> {
  @override
  Widget build(BuildContext context) {
    var firestore = FirebaseFirestore.instance.collection("users").snapshots();

    return Scaffold(
        appBar: appBarSimple(context, "Score"),
        body: Container(
          child: StreamBuilder(
            stream: firestore,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              if ((snapshot.data?.docs.length).toString() == "null" ||
                  (snapshot.data?.docs.length).toString() == "0") {
                return Container(
                    alignment: Alignment.center,
                    child: Text(
                      "No Candidate to Display !",
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
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data?.docs[index]["userType"] == "0" && snapshot.data?.docs[index]["about"] != "" && snapshot.data?.docs[index]["qualification"] != "") {
                      return checkScoreList(snapshot, context, index);
                    } else {
                      return Container();
                    }
                  },
                );
              }
            },
          ),
        ));
  }
}
