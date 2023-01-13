import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/createQuizProvider.dart';
import '../../reusableWidgets/Responsive.dart';

Widget toggleButtonForDifficultyLevel(context) {
  return Container(
      margin: EdgeInsets.only(
          top: setSize(context, 10), bottom: setSize(context, 20)),
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
          FocusManager.instance.primaryFocus?.unfocus();
          providerValue.getQuizDifficulty(changedValue);
        },
      ),
      textWidget(context, "Easy")
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
          FocusManager.instance.primaryFocus?.unfocus();
          providerValue.getQuizDifficulty(changedValue);
        },
      ),
      textWidget(context, "Medium")
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
          FocusManager.instance.primaryFocus?.unfocus();
          providerValue.getQuizDifficulty(changedValue);
        },
      ),
      textWidget(context, "Difficult")
    ],
  );
}

Text textWidget(context, value) {
  return Text(value,
      style: TextStyle(fontSize: setSize(context, 18), color: Colors.black));
}
