import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../reusableWidgets/Responsive.dart';
import 'provider.dart';
import 'textFieldWidgets.dart';

Future dialogBuilder(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Consumer<CreateQuizProvider>(
        builder: (context, providerValue, child) {
          return AlertDialog(
            scrollable: true,
            elevation: 10,
            alignment: Alignment.center,
            contentPadding: const EdgeInsets.all(20),
            actionsAlignment: MainAxisAlignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Center(child: Text("Question")),
            content: Container(
              padding: const EdgeInsets.all(10),
              width: screenWidth(context),
              child: Column(
                children: [
                  textFieldQuestions(providerValue),
                  textFieldOption1(providerValue),
                  textFieldOption2(providerValue),
                  textFieldOption3(providerValue),
                  textFieldOption4(providerValue),
                ],
              ),
            ),
            actions: [
              Container(
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
                            providerValue.setDataToList();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Submit")),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
