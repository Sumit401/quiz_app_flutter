import 'package:flutter/material.dart';

Widget actionsOfAlertDialogBox(context, providerValue) {
  return SingleChildScrollView(
    child: Container(
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
    ),
  );
}
