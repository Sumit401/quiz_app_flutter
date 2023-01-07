
import 'package:flutter/material.dart';
import 'package:flutter_project/reusableWidgets/Responsive.dart';

import 'dialogBoxForInstructions.dart';

Widget showQuizForStudent(context, snapshot, index) {
  return Card(
    margin: const EdgeInsets.all(10),
    elevation: 20,
    child: Column(
      children: [
        textDisplay(snapshot.data.docs[index]['Quiz Title'].toString(), "title",context),
        textDisplay(snapshot.data.docs[index]['Quiz Description'].toString(), "desc",context),
        textDisplay(snapshot.data.docs[index]['Difficulty'].toString(), "diff",context),
        textDisplay(snapshot.data.docs[index]['Total Questions'].toString(), "total",context),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () => dialogBoxForInstructions(context), child: Text("Attempt Quiz")),
        )
      ],
    ),
  );
}

Widget textDisplay(value, type, context) {
  return Container(
      padding: type == "title"
          ? const EdgeInsets.all(20)
          : const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Text(
          type == "diff"
              ? "Difficulty : $value"
              : type == "total"
                  ? "Questions to Attempt : $value"
                  : "$value",
          style: textStyle(type, context)));
}

TextStyle textStyle(value, context) {
  return TextStyle(
      fontSize: (value == "title") ? setFontSize(context, 20) : setFontSize(context, 17),
      color: (value == "title") ? Colors.blue.shade700 : Colors.black,
      fontWeight: (value == "title") ? FontWeight.w800 : FontWeight.w600,
      overflow: TextOverflow.visible);
}
