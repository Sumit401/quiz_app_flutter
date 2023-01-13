import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/createQuizProvider.dart';
import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/appBar.dart';
import 'listView.dart';
import 'submitQuizButton.dart';
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
      appBar: appBarCreate(context, "Create Quiz"),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Consumer<CreateQuizProvider>(
            builder: (context, providerValue, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textFieldTitle(providerValue),
                    textFieldDescription(providerValue),
                    toggleButtonForDifficultyLevel(context),
                    listViewQuestions(context, providerValue),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: submitQuizButton(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
