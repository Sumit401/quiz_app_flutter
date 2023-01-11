import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../reusableWidgets/Responsive.dart';
import '../startQuiz/mainPage.dart';
import '../startQuiz/providers/snapshotProvider.dart';
import '../startQuiz/providers/startQuizProvider.dart';
import '../startQuiz/providers/studentProvider.dart';
import '../startQuiz/providers/timerProvider.dart';

dialogBoxForInstructions(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        width: screenWidth(context),
        child: AlertDialog(
              elevation: 20,
              scrollable: true,
              alignment: Alignment.center,
              actionsPadding: actionsPaddingDialogBox(context),
              contentPadding: contentPaddingDialogBox(context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: alertDialogTitle(context),
              content: alertDialogContent(context),
              actions: [ alertDialogActions(context) ],
            )
      );
    },
  );
}

Text alertDialogTitle(context) {
  return Text("Instructions",
      style: TextStyle(color: Colors.red, fontSize: setSize(context, 22)));
}


Widget alertDialogContent(context) {
  return Consumer<StudentProvider>(builder: (context, providerValue, child) {
    return Text(
        "\u2022 Welcome to Online ${providerValue.quizTitle} \n\u2022 Exam has Total ${providerValue.totalQuestions} Questions.\n\u2022 Total Time for the Exam is ${int.parse(providerValue.totalQuestions) * 2} Minutes \n\u2022 Negative Marking : No \n\u2022 Each Question is Compulsory to Attend",
        textAlign: TextAlign.start,
        style: TextStyle(
            wordSpacing: 1, height: 1.5, fontSize: setSize(context, 15)));
  });
}

Widget alertDialogActions(context) {
  return Consumer4<StartQuizProvider, StudentProvider, TimerProvider, SnapshotProvider>(
    builder: (context, startQuizProvider, studentProvider, timerProvider, snapshotProvider, child) {
      return ElevatedButton(
          onPressed: () {
            startQuizProvider.resetAnswerValue();
            startQuizProvider.resetTotalCorrectAns();
            int time = int.parse(studentProvider.totalQuestions) * 2 * 60;
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

EdgeInsets contentPaddingDialogBox(BuildContext context) {
  return EdgeInsets.symmetric(
      vertical: setSize(context, 30), horizontal: setSize(context, 30));
}

EdgeInsets actionsPaddingDialogBox(BuildContext context) {
  return EdgeInsets.only(
      right: setSize(context, 30),
      bottom: setSize(context, 20),
      top: setSize(context, 10));
}
