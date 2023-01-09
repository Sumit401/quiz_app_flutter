import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Student/provider.dart';
import 'package:flutter_project/reusableWidgets/appBar.dart';
import 'package:provider/provider.dart';

import 'pageViewContainer.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  final PageController _pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple(context, "Start Quiz"),
      body: Consumer<StudentProvider>(
        builder: (context, providerValue, child) {
          var firestoreSnapshots = FirebaseFirestore.instance
              .collection("users")
              .doc(providerValue.facultyID)
              .collection("questions")
              .doc(providerValue.quizID)
              .collection(providerValue.quizID)
              .snapshots();

          int count = int.parse(providerValue.totalQuestions);

          return Container(
            //color: hexToColor("#a27cc1"),
            alignment: Alignment.topCenter,
            child: StreamBuilder(
                stream: firestoreSnapshots,
                builder: (context, snapshot) {
                  return PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pagecontroller,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return pageViewContainer(snapshot, index, _pagecontroller,context);
                    },
                  );
                }),
          );
        },
      ),
    );
  }
}
