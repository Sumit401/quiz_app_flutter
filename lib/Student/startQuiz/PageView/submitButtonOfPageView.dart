
import 'package:flutter/material.dart';
import 'package:flutter_project/Student/startQuiz/provider.dart';

import '../../../reusableWidgets/Responsive.dart';
import '../../../reusableWidgets/createColor.dart';

Widget submitButtonPageView(context,pageController,answers,snapshot,index, StartQuizProvider providerValue){
  return ElevatedButton(
      style: buttonStyle(context),
      onPressed: () {
        if(providerValue.answerIndex >= 0) {
            pageController.nextPage(
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease);
            print(answers[providerValue.answerIndex]);

            if(answers[providerValue.answerIndex] == snapshot.data?.docs[index]["Answer1"]) {
              print("Correct Answer");
              providerValue.getTotalRight();
            } else {
              print("Incorrect Answer");
            }
            print("Total Right Answers ${providerValue.totalRight}");
            providerValue.resetAnswerValue();
            if(index+1 == snapshot.data?.docs.length) {
              print("Quiz Over");

            }
        }

      },
      child: Text(
        "Submit",
        style: TextStyle(fontSize: setSize(context, 20)),
      ));
}

buttonStyle(context) {
  return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(hexToColor("#24BA73")),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
          horizontal: setSize(context, 15), vertical: setSize(context, 10))));
}