import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/appBar.dart';
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
                return const CircularProgressIndicator();
              }
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  if (snapshot.data?.docs[index]["userType"] == "0") {
                    return checkScoreList(snapshot, context, index);
                  } else {
                    return Container();
                  }
                },
              );
            },
          ),
        ));
  }
}
