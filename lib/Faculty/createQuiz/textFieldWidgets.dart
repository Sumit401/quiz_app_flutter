import 'package:flutter/material.dart';

Widget textFieldTitle(providerValue) {
  return TextFormField(
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        providerValue.getQuizTitle(value);
      },
      decoration: const InputDecoration(labelText: "Quiz Title"));
}

Widget textFieldDescription(providerValue) {
  return TextFormField(
    textCapitalization: TextCapitalization.words,
    onChanged: (value) {
      providerValue.getQuizDesc(value);
    },
    decoration: const InputDecoration(labelText: "Quiz Description"),
    maxLines: 3,
    minLines: 3,
  );
}

Widget textFieldQuestions(providerValue) {
  return TextFormField(
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
        label: Container(
            alignment: Alignment.centerLeft, child: const Text("Question"))),
    minLines: 2,
    maxLines: 2,
    expands: false,
    onChanged: (value) {
      providerValue.getQuestionInfo(value);
    },
  );
}

Widget textFieldOption1(providerValue) {
  return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
          labelText: "Option 1 (Correct Answer)",
          labelStyle: TextStyle(color: Colors.green)),
      onChanged: (value) => providerValue.getOption1(value));
}

Widget textFieldOption2(providerValue) {
  return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
          labelText: "Option 2",
          labelStyle: TextStyle(color: Colors.redAccent)),
      onChanged: (value) => providerValue.getOption2(value));
}

Widget textFieldOption3(providerValue) {
  return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
          labelText: "Option 3",
          labelStyle: TextStyle(color: Colors.redAccent)),
      onChanged: (value) => providerValue.getOption3(value));
}

Widget textFieldOption4(providerValue) {
  return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
          labelText: "Option 4",
          labelStyle: TextStyle(color: Colors.redAccent)),
      onChanged: (value) => providerValue.getOption4(value));
}
