import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';
import '../textFieldWidgets.dart';

Widget contentOfAlertDialogBox(context, providerValue) {
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(10),
      width: screenWidth(context),
      child: Column(
        children: [
          textFieldQuestions(providerValue),
          Container(
            height: 30,
          ),
          textFieldOption1(providerValue),
          textFieldOption2(providerValue),
          textFieldOption3(providerValue),
          textFieldOption4(providerValue),
        ],
      ),
    ),
  );
}
