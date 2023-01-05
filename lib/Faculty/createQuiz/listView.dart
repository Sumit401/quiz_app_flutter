import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

String ques = "";
String opt1 = "";
String opt2 = "";
String opt3 = "";
String opt4 = "";

Widget listViewQuestions(providerValue) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: providerValue.list.length,
      itemBuilder: (context, index) {
        getDataFromList(providerValue, index);
        return cardWidgetOfList(index);
      },
    ),
  );
}

Widget cardWidgetOfList(index) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    child: Card(child: Consumer<CreateQuizProvider>(
      builder: (context, providerValue, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Text("$index"),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [question(), questionValue()],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      optionA(),
                      optionB(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      optionC(),
                      optionD(),
                    ],
                  ),
                ],
              ),
            ),
            deleteQuestionFromList(providerValue,index),
          ],
        );
      },
    )),
  );
}

void getDataFromList(providerValue, index) {
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
}

Container optionA() {
  return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        "A.) $opt1",
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ));
}

Container optionB() {
  return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        "B.) $opt2",
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ));
}

Container optionC() {
  return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        "C.) $opt3",
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ));
}

Container optionD() {
  return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        "D.) $opt4",
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ));
}

Container question() {
  return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: const Text(
        "Question: ",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ));
}

Container questionValue() {
  return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 10, left: 10, top: 2),
      child: Text(
        ques,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ));
}

Widget deleteQuestionFromList(providerValue,index){
  return InkWell(
    child: Container(
        padding: EdgeInsets.all(20),
        child: const Icon(FontAwesomeIcons.trash)),
    onTap: () {
      providerValue.deleteData(index);
    },
  );
}