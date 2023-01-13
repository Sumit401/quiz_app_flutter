import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/createQuizProvider.dart';
import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/createColor.dart';

String ques = "";
String opt1 = "";
String opt2 = "";
String opt3 = "";
String opt4 = "";

Widget listViewQuestions(context, providerValue) {
  if (providerValue.list.length <= 0 ||
      providerValue.list.length.toString() == "null") {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight(context) < 500 ? 0 : 50),
          alignment: Alignment.center,
          child: Text(
            "\n\nAdd Questions to Quiz from '+' icon on Upper Right Corner.\n\n",
            style: TextStyle(
                fontSize: setSize(context, 24),
                fontWeight: FontWeight.bold,
                color: hexToColor("#8f3040"),
                overflow: TextOverflow.visible,
                wordSpacing: 2,
                letterSpacing: 0.4),
            textAlign: TextAlign.center,
          )),
    );
  } else {
    return Expanded(
      flex: getScreenHeight(context) == "small"
          ? 1
          : getScreenHeight(context) == "medium"
              ? 2
              : 3,
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
                  question(index, context),
                  questionValue(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      options("A.) $opt1", context),
                      options("B.) $opt2", context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      options("C.) $opt3", context),
                      options("D.) $opt4", context),
                    ],
                  ),
                ],
              ),
            ),
            deleteQuestionFromList(providerValue, index),
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

Expanded options(value, context) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        value,
        style: TextStyle(
            fontSize: setSize(context, 14),
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Container question(index, context) {
  return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Text(
        "Question: #${index + 1}",
        style: TextStyle(
            fontSize: setSize(context, 18),
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ));
}

Container questionValue(context) {
  return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 10, left: 10, top: 2),
      child: Text(
        ques,
        style: TextStyle(
            fontSize: setSize(context, 18),
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ));
}

Widget deleteQuestionFromList(providerValue, index) {
  return InkWell(
    child: Container(
        padding: EdgeInsets.all(20), child: const Icon(FontAwesomeIcons.trash)),
    onTap: () {
      providerValue.deleteData(index);
    },
  );
}
