import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/createColor.dart';

Widget pageViewContainer(snapshot, index, _pagecontroller, context) {
  List answers = [];
  answers.add(snapshot.data?.docs[index]["Answer1"]);
  answers.add(snapshot.data?.docs[index]["Answer2"]);
  answers.add(snapshot.data?.docs[index]["Answer3"]);
  answers.add(snapshot.data?.docs[index]["Answer4"]);
  answers.shuffle();
  return Container(
    margin: EdgeInsets.only(top: setSize(context, 30)),
    alignment: Alignment.center,
    child: Column(
      children: [
        questionNoContainer(context, index, snapshot),
        dividerLineContainer(context),
        questionContainer(context, index, snapshot),

        ToggleSwitch(
          initialLabelIndex: 0,
          totalSwitches: 4,
          labels: [
            answerContainer(context, "A.) ${answers[0]}"),
            answerContainer(context, "B.) ${answers[1]}"),
            answerContainer(context, "C.) ${answers[2]}"),
            answerContainer(context, "D.) ${answers[3]}"),
          ],
          onToggle: (index) {
            print('switched to: $index');
          },
        ),

        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(hexToColor("#24BA73")),
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    horizontal: setSize(context, 15),
                    vertical: setSize(context, 10)))),
            onPressed: () {
              //print(providerValue.answersList[0]);
              _pagecontroller.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.ease);
              answers.clear();
            },
            child: Text(
              "Submit",
              style: TextStyle(fontSize: setSize(context, 20)),
            ))
      ],
    ),
  );
}

questionContainer(context, index, snapshot) {
  return Container(
    margin: EdgeInsets.symmetric(
        vertical: setSize(context, 20), horizontal: setSize(context, 20)),
    child: Text("${snapshot.data?.docs[index]["Question"]}",
        style: TextStyle(
            color: Colors.black,
            fontSize: setSize(context, 20),
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.justify),
  );
}

answerContainer(context, value) {
  return Container(
      margin: EdgeInsets.only(bottom: setSize(context, 10)),
      width: screenWidth(context) / 1.2,
      decoration: BoxDecoration(
          color: hexToColor("#928FFF"),
          shape: BoxShape.rectangle,
          border: Border.all(),
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(setSize(context, 20)),
      child: Text(
        value,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: setSize(context, 16),
            color: Colors.white,
            fontWeight: FontWeight.w500),
      ));
}

questionNoContainer(context, index, snapshot) {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: setSize(context, 20)),
    child: Text("Question ${index + 1}/${snapshot.data?.docs.length}",
        style: TextStyle(
            fontSize: setSize(context, 25),
            fontWeight: FontWeight.w500,
            color: Colors.cyan),
        textAlign: TextAlign.right),
  );
}

dividerLineContainer(context) {
  return Container(
    color: Colors.black,
    width: screenWidth(context),
    height: 1,
  );
}
