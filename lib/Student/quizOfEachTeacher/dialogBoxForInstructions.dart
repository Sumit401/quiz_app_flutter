import 'package:flutter/material.dart';
import 'package:flutter_project/Student/provider.dart';
import 'package:flutter_project/Student/startQuiz/mainPage.dart';
import 'package:flutter_project/Student/startQuiz/provider.dart';
import 'package:flutter_project/reusableWidgets/Responsive.dart';
import 'package:provider/provider.dart';

dialogBoxForInstructions(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        width: screenWidth(context),
        child: Consumer2<StudentProvider,StartQuizProvider>(
          builder: (context, studentProvider, startQuizProvider, child) {
            return AlertDialog(
              elevation: 20,
              scrollable: true,
              alignment: Alignment.center,
              actionsPadding: actionsPaddingDialogBox(context),
              contentPadding: contentPaddingDialogBox(context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: alertDialogTitle(context),
              content: alertDialogContent(context, studentProvider),
              actions: [ alertDialogActions(context,startQuizProvider) ],
            );
          },
        ),
      );
    },
  );
}

Text alertDialogTitle(context) {
  return Text("Instructions",
      style: TextStyle(color: Colors.red, fontSize: setSize(context, 22)));
}


Text alertDialogContent(context, providerValue) {
  return Text(
      "\u2022 Welcome to Online ${providerValue.quizTitle} \n\u2022 Exam has Total ${providerValue.totalQuestions} Questions.\n\u2022 Total Time for the Exam is ${int.parse(providerValue.totalQuestions) * 2} Minutes \n\u2022 Negative Marking : No \n\u2022 Each Question is Compulsory to Attend",
      textAlign: TextAlign.start,
      style: TextStyle(
          wordSpacing: 1, height: 1.5, fontSize: setSize(context, 15)));
}


Widget alertDialogActions(context, StartQuizProvider startQuizProvider,) {
  return ElevatedButton(
      onPressed: () {
        startQuizProvider.resetAnswerValue();
        startQuizProvider.resetTotalCorrectAns();
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StartQuiz()));
      },
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.green)),
      child: const Text("Start Test"));
}


EdgeInsets contentPaddingDialogBox(BuildContext context) {
  return EdgeInsets.symmetric(
      vertical: setSize(context, 30),
      horizontal: setSize(context, 30));
}

EdgeInsets actionsPaddingDialogBox(BuildContext context) {
  return EdgeInsets.only(
      right: setSize(context, 30),
      bottom: setSize(context, 20),
      top: setSize(context, 10));
}
