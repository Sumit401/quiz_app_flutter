import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/studentProviders/studentProvider.dart';
import '../../reusableWidgets/Responsive.dart';
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
      appBar: appBarSimple(context, "Quiz From Faculty"),
      body: Consumer<StudentProvider>(
        builder: (context, providerValue, child) {
          // Firebase Snapshot......................
          var firestoreSnapshots = FirebaseFirestore.instance
              .collection("users")
              .doc(providerValue.facultyEmail)
              .collection("questions")
              .snapshots();

          return Container(
            alignment: Alignment.topCenter,
            child: StreamBuilder(
              stream: firestoreSnapshots,
              builder: (context, snapshot) {
                if ((snapshot.data?.docs.length).toString() == "null" ||
                    (snapshot.data?.docs.length).toString() == "0") {
                  // If no List Available show this container.....................
                  return Container(
                      alignment: Alignment.center,
                      child: textNoQuizAvailable());
                } else {
                  // Create listView of the Faculty Quiz..........................
                  return
                    ResponsiveWidget.isSmallScreen(context)
                  ? ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return showQuizForStudent(context, snapshot, index);
                          },
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      ResponsiveWidget.isMediumScreen(context)
                                          ? 2
                                          : 3,
                                  mainAxisExtent: screenHeight(context) / 1.5),
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
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

  Text textNoQuizAvailable() {
    return Text(
      "This Faculty has no Quiz to Show.\n Kindly check back later.!",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: setSize(context, 17),
          fontWeight: FontWeight.bold,
          color: hexToColor("#263300"),
          overflow: TextOverflow.visible,
          wordSpacing: 2,
          letterSpacing: 0.4),
    );
  }
}
