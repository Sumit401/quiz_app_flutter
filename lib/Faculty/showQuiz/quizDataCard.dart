
import 'package:flutter/material.dart';

import 'alertDialog/alertDialog.dart';

Widget showQuizData(context, snapshot, index) {
  return InkWell(
    child: Card(
      margin: const EdgeInsets.all(10),
      elevation: 20,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Text(snapshot.data.docs[index]['Quiz Title'].toString(),
                  style: textStyle("title"))),
          Container(
              padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
              child: Text(snapshot.data.docs[index]['Quiz Description'].toString(),
                style: textStyle("desc"),
              )),
        ],
      ),
    ),
    onTap: () {
      alertDialogMyQuiz(context,snapshot,index);
    },
  );
}

TextStyle textStyle(value) {
  return TextStyle(
      fontSize: (value == "title") ? 22 : 14,
      color: (value == "title") ? Colors.blue.shade700 : Colors.black,
      fontWeight: (value == "title") ? FontWeight.w800 : FontWeight.w600,
      overflow: TextOverflow.visible);
}