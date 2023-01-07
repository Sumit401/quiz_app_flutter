import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/createQuiz/provider.dart';
import 'package:provider/provider.dart';

Widget toggleButtonForDifficultyLevel(){
  return Container(
    padding: EdgeInsets.only(top: 10),
    child: Consumer<CreateQuizProvider>(
      builder: (context, providerValue, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: RadioListTile(
                  dense: true,
                  activeColor: Colors.cyan,
                  title: const Text("Easy",style: TextStyle(fontSize: 12,color: Colors.black,)),
                  value: 0,
                  groupValue: providerValue.radioForQuizDifficulty,
                  onChanged: (changedValue) {
                    providerValue.getQuizDifficulty(changedValue);
                  },
                )),
            Expanded(
                child: RadioListTile(
                  dense: true,
                  activeColor: Colors.cyan,
                  title: const Text("Medium",style: TextStyle(fontSize: 12,color: Colors.black)),
                  value: 1,
                  groupValue: providerValue.radioForQuizDifficulty,
                  onChanged: (changedValue) {
                    providerValue.getQuizDifficulty(changedValue);
                  },
                )),
            Expanded(
                child: RadioListTile(
                  dense: true,
                  activeColor: Colors.cyan,
                  title: const Text("Difficult",style: TextStyle(fontSize: 12,color: Colors.black)),
                  value: 2,
                  groupValue: providerValue.radioForQuizDifficulty,
                  onChanged: (changedValue) {
                    providerValue.getQuizDifficulty(changedValue);
                  },
                )),
          ],
        );
      },
    )
  );
}