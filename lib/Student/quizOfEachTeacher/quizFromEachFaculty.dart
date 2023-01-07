
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Student/provider.dart';
import 'package:provider/provider.dart';
import '../../reusableWidgets/appBar.dart';
import '../../reusableWidgets/createColor.dart';
import 'showQuizForStudent.dart';

class QuizFromEachFaculty extends StatefulWidget {
  const QuizFromEachFaculty({Key? key}) : super(key: key);

  @override
  State<QuizFromEachFaculty> createState() => _QuizFromEachFacultyState();
}

class _QuizFromEachFacultyState extends State<QuizFromEachFaculty> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBarSimple(context,"Teacher Quiz"),
      body: Consumer<StudentProvider>(
        builder: (context, providerValue, child) {
          var firestoreSnapshots = FirebaseFirestore.instance.collection("users").doc(providerValue.facultyID).collection("questions").snapshots();
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
                      return showQuizForStudent(context, snapshot, index);

                    },
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
