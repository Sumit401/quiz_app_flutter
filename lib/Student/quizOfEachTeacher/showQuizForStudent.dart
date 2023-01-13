import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/studentProviders/studentProvider.dart';
import '../../reusableWidgets/Responsive.dart';
import '../InstructionDialog/dialogMain.dart';

Widget showQuizForStudent(context, snapshot, index) {
  return Card(
    margin: const EdgeInsets.all(10),
    elevation: 20,
    child: Column(
      children: [
        textDisplay(snapshot.data.docs[index]['Quiz Title'].toString(), "title",
            context),
        textDisplay(snapshot.data.docs[index]['Quiz Description'].toString(),
            "desc", context),
        textDisplay(snapshot.data.docs[index]['Difficulty'].toString(), "diff",
            context),
        textDisplay(snapshot.data.docs[index]['Total Questions'].toString(),
            "total", context),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<StudentProvider>(
            builder: (context, providerValue, child) {
              return ElevatedButton(
                  onPressed: () async {
                    providerValue.getDifficultyLevel(
                        snapshot.data.docs[index]['Difficulty'].toString());
                    providerValue.getTotalQuestions(snapshot
                        .data.docs[index]['Total Questions']
                        .toString());
                    providerValue.getQuizTitle(
                        snapshot.data.docs[index]['Quiz Title'].toString());
                    providerValue.getQuizDescription(snapshot
                        .data.docs[index]['Quiz Description']
                        .toString());
                    providerValue
                        .getQuizID(snapshot.data.docs[index].id.toString());
                    dialogBoxForInstructions(context);
                  },
                  child: Text("Attempt Quiz"));
            },
          ),
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
      fontSize:
          (value == "title") ? setSize(context, 20) : setSize(context, 17),
      color: (value == "title") ? Colors.blue.shade700 : Colors.black,
      fontWeight: (value == "title") ? FontWeight.w800 : FontWeight.w600,
      overflow: TextOverflow.visible);
}
