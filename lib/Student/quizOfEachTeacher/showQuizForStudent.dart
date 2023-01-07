
import 'package:flutter/material.dart';

Widget showQuizForStudent(context, snapshot, index) {
  return Card(
    margin: const EdgeInsets.all(10),
    elevation: 20,
    child: Column(
      children: [
        textDisplay(snapshot.data.docs[index]['Quiz Title'].toString(), "title"),
        textDisplay(snapshot.data.docs[index]['Quiz Description'].toString(), "desc"),
        textDisplay(snapshot.data.docs[index]['Difficulty'].toString(), "diff"),
        textDisplay(snapshot.data.docs[index]['Total Questions'].toString(), "total"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () => null, child: Text("Attempt Quiz")),
        )
      ],
    ),
  );
}

Widget textDisplay(value, type) {
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
          style: textStyle(type)));
}

TextStyle textStyle(value) {
  return TextStyle(
      fontSize: (value == "title") ? 22 : 14,
      color: (value == "title") ? Colors.blue.shade700 : Colors.black,
      fontWeight: (value == "title") ? FontWeight.w800 : FontWeight.w600,
      overflow: TextOverflow.visible);
}
