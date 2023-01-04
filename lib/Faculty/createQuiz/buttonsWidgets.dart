
import 'package:flutter/material.dart';

import 'dialogAddQuestion.dart';

Widget addQuestionsButton(context) {
  return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => dialogBuilder(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Icon(Icons.add), Text("Add Questions")],
        ),
      ));
}


Widget submitQuizButton() {
  return ElevatedButton(onPressed: () => null, child: Text("Submit Quiz"));
}
