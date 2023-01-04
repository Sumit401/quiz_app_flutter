import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

String ques = "";
String opt1 = "";
String opt2 = "";
String opt3 = "";
String opt4 = "";

Widget listViewQuestions(providerValue){
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: providerValue.list.length,
      itemBuilder: (context, index) {

        providerValue.list.elementAt(index).forEach((key, value) {
          if (key == "Question") {
            ques = value;
          } else if (key == "Answer1") {
            opt1 = value;
          } else if (key == "Answer2") {
            opt2 = value;
          } else if (key == "Answer3") {
            opt3 = value;
          } else if (key == "Answer4") {
            opt4 = value;
          }
        });
        return Card(
            child: Consumer<CreateQuizProvider>(
              builder: (context, providerValue, child) {
                return
                  Column(
                    children: [
                      Text("$index"),
                      Text(ques),
                      Text(opt1),
                      Text(opt2),
                      Text(opt3),
                      Text(opt4),
                      InkWell(child: const Icon(FontAwesomeIcons.trash),onTap: () {
                        providerValue.deleteData(index);
                      },)
                    ],
                  );
              },

            ));
      },
    ),
  );
}