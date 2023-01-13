import 'package:flutter/material.dart';

import 'alertDialogContent.dart';
import 'alertDialogTitle.dart';

alertDialogMyQuiz(context, snapshot, index) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        title: titleOfAlertDialog(context, index, snapshot),
        content: contentOfAlertDialog(context, index, snapshot),
      );
    },
  );
}
