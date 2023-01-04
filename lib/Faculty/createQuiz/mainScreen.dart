import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/createQuiz/provider.dart';
import 'package:provider/provider.dart';

import 'buttonsWidgets.dart';
import 'listView.dart';
import 'textFieldWidgets.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Quiz"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Consumer<CreateQuizProvider>(
          builder: (context, providerValue, child) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  textFieldTitle(providerValue),
                  textFieldDescription(providerValue),
                  listViewQuestions(providerValue),
                  addQuestionsButton(context),
                  submitQuizButton(),
                ],
              ),
            );
          },
        ));
  }
}
