import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/studentProviders/startQuizProvider.dart';
import '../../../providers/studentProviders/studentProvider.dart';
import '../../../providers/studentProviders/studentSnapshotProvider.dart';
import '../../../providers/studentProviders/timerCountDownProvider.dart';
import '../startQuiz/mainPage.dart';

Widget alertDialogActions(context) {
  return Consumer4<StartQuizProvider, StudentProvider, TimerProvider,
      SnapshotProvider>(
    builder: (context, startQuizProvider, studentProvider, timerProvider,
        snapshotProvider, child) {
      return ElevatedButton(
          onPressed: () {
            startQuizProvider.resetAnswerValue();
            startQuizProvider.resetTotalCorrectAns();
            int time = int.parse(studentProvider.totalQuestions) * 1 * 60;
            timerProvider.setTimerData(time);

            var firestoreSnapshots = FirebaseFirestore.instance
                .collection("users")
                .doc(studentProvider.facultyEmail)
                .collection("questions")
                .doc(studentProvider.quizID)
                .collection(studentProvider.quizID)
                .snapshots();

            snapshotProvider.setfirestoreSnapshots(firestoreSnapshots);
            Navigator.pop(context);
            Navigator.pop(context);
            timerProvider.startTimer();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StartQuiz()));
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green)),
          child: const Text("Start Test"));
    },
  );
}
