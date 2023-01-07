import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/createQuiz/provider.dart';
import 'package:provider/provider.dart';

import '../../reusableWidgets/Responsive.dart';

Widget toggleButtonForDifficultyLevel() {
  return Container(
    margin: EdgeInsets.only(top: 10,bottom: 20),
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Consumer<CreateQuizProvider>(
        builder: (context, providerValue, child) {
          return SizedBox(
            width: screenWidth(context),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                toggleButtonEasy(providerValue, context),
                toggleButtonMedium(providerValue, context),
                toggleButtonDifficult(providerValue, context),
              ],
            ),
          );
        },
      ));
}

Widget toggleButtonEasy(providerValue, context) {
  return Row(
    children: [
      Radio(
        activeColor: Colors.cyan,
        value: 0,
        groupValue: providerValue.radioForQuizDifficulty,
        onChanged: (changedValue) {
          providerValue.getQuizDifficulty(changedValue);
        },
      ),
      textWidget(context,"Easy")
    ],
  );
}

Widget toggleButtonMedium(providerValue, context) {
  return Row(
    children: [
      Radio(
        activeColor: Colors.cyan,
        value: 1,
        groupValue: providerValue.radioForQuizDifficulty,
        onChanged: (changedValue) {
          providerValue.getQuizDifficulty(changedValue);
        },
      ),
      textWidget(context,"Medium")
    ],
  );
}

Widget toggleButtonDifficult(providerValue, context) {
  return Row(
    children: [
      Radio(
        activeColor: Colors.cyan,
        value: 2,
        groupValue: providerValue.radioForQuizDifficulty,
        onChanged: (changedValue) {
          providerValue.getQuizDifficulty(changedValue);
        },
      ),
      textWidget(context, "Difficult")
    ],
  );
}


Text textWidget(context, value) {
  return Text(value,
      style:
          TextStyle(fontSize: setFontSize(context, 18), color: Colors.black));
}