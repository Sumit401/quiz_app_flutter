import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/studentProviders/studentProvider.dart';
import '../../../reusableWidgets/Responsive.dart';

Text alertDialogTitle(context) {
  return Text("Instructions",
      style: TextStyle(color: Colors.red, fontSize: setSize(context, 22)));
}

Widget alertDialogContent(context) {
  return Consumer<StudentProvider>(builder: (context, providerValue, child) {
    return Text(
        "\u2022 Welcome to Online ${providerValue.quizTitle} \n\u2022 Exam has Total ${providerValue.totalQuestions} Questions.\n\u2022 Total Time for the Exam is ${int.parse(providerValue.totalQuestions)} Minutes \n\u2022 Negative Marking : No \n\u2022 Each Question is Compulsory to Attend \n\u2022 You Can't Navigate back to previous Question.",
        textAlign: TextAlign.start,
        style: TextStyle(
            wordSpacing: 1, height: 1.5, fontSize: setSize(context, 15)));
  });
}
