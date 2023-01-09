import 'package:flutter/material.dart';
import 'package:flutter_project/Student/provider.dart';
import 'package:flutter_project/Student/startQuiz/mainPage.dart';
import 'package:flutter_project/reusableWidgets/Responsive.dart';
import 'package:provider/provider.dart';

dialogBoxForInstructions(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        width: screenWidth(context),
        child: Consumer<StudentProvider>(
          builder: (context, providerValue, child) {
            return AlertDialog(
              elevation: 20,
              scrollable: true,
              alignment: Alignment.center,
              actionsPadding:
                  const EdgeInsets.only(right: 30, bottom: 20, top: 10),
              contentPadding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text("Instructions",
                  style: TextStyle(
                      color: Colors.red, fontSize: setSize(context, 22))),
              content: Text(
                  "\u2022 Welcome to Online ${providerValue.quizTitle} \n\u2022 Exam has Total ${providerValue.totalQuestions} Questions.\n\u2022 Total Time for the Exam is ${int.parse(providerValue.totalQuestions) * 2} Minutes \n\u2022 Negative Marking : No",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      wordSpacing: 1,
                      height: 1.5,
                      fontSize: setSize(context, 15))),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const StartQuiz()));
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  child: const Text("Start Test"),
                )
              ],
            );
          },
        ),
      );
    },
  );
}
