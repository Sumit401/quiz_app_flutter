import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Student/provider.dart';
import 'package:provider/provider.dart';

import 'PageView/pageViewContainer.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  final PageController _pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //appBar: appBarSimpleWithoutBack(context, "Start Quiz"),
        body: Consumer<StudentProvider>(
          builder: (context, providerValue, child) {
            var firestoreSnapshots = FirebaseFirestore.instance
                .collection("users").doc(providerValue.facultyID)
                .collection("questions").doc(providerValue.quizID)
                .collection(providerValue.quizID).snapshots();

            return Container(
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
      ),
    );
  }
}
