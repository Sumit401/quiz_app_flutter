import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../reusableWidgets/alertDialogLogout.dart';

AppBar appBarContent(context) {
  return AppBar(
    title: const Text("My Quizzes"),
    centerTitle: true,
    elevation: 10,
    actions: [
      containerLogout(context),

    ],
    backgroundColor: Colors.blueGrey,
  );
}

Container containerLogout(context) {
  return Container(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogSignOut(context);
              },
            );
          },
          child: Icon(FontAwesomeIcons.rightFromBracket)));
}
