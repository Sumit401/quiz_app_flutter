import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/appBar.dart';
import 'provider.dart';
import 'submitQuizButton.dart';
import 'alertDialogAddQuestions/dialogAddQuestion.dart';
import 'listView.dart';
import 'textFieldWidgets.dart';
import 'toggleButtonForDifficultyLevel.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSimple(context,"Create Quiz"),
        body: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Consumer<CreateQuizProvider>(
            builder: (context, providerValue, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    textFieldTitle(providerValue),
                    textFieldDescription(providerValue),
                    toggleButtonForDifficultyLevel(),
                    listViewQuestions(providerValue),
                    addQuestionsButton(context),
                    submitQuizButton(),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
