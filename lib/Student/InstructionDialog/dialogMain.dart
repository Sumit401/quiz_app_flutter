import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';
import 'dialogAction.dart';
import 'dialogContent.dart';

dialogBoxForInstructions(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
          width: screenWidth(context),
          child: AlertDialog(
            elevation: 20,
            scrollable: true,
            alignment: Alignment.center,
            actionsPadding: actionsPaddingDialogBox(context),
            contentPadding: contentPaddingDialogBox(context),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: alertDialogTitle(context),
            content: alertDialogContent(context),
            actions: [alertDialogActions(context)],
          ));
    },
  );
}

EdgeInsets contentPaddingDialogBox(BuildContext context) {
  return EdgeInsets.symmetric(
      vertical: setSize(context, 30), horizontal: setSize(context, 30));
}

EdgeInsets actionsPaddingDialogBox(BuildContext context) {
  return EdgeInsets.only(
      right: setSize(context, 30),
      bottom: setSize(context, 20),
      top: setSize(context, 10));
}
