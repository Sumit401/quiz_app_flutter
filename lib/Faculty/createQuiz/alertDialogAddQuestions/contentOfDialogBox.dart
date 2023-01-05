
import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';
import '../textFieldWidgets.dart';

Widget actionsOfAlertDialogBox(context,providerValue) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              if (providerValue.questionInfo != "" &&
                  providerValue.option1 != "" &&
                  providerValue.option2 != "" &&
                  providerValue.option3 != "" &&
                  providerValue.option4 != "") {
                FocusScope.of(context).requestFocus(FocusNode());
                providerValue.setDataToList();
                Navigator.pop(context);
              }
            },
            child: const Text("Submit")),
      ],
    ),
  );
}

Widget contentOfAlertDialogBox(context,providerValue) {
  return Container(
    padding: const EdgeInsets.all(10),
    width: screenWidth(context),
    child: Column(
      children: [
        textFieldQuestions(providerValue),
        Container(height: 30,),
        textFieldOption1(providerValue),
        textFieldOption2(providerValue),
        textFieldOption3(providerValue),
        textFieldOption4(providerValue),
      ],
    ),
  );
}
