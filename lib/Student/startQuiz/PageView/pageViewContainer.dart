import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';
import 'contentOfPageView.dart';
import 'listViewofPageView.dart';
import 'submitButtonOfPageView.dart';

Widget pageViewContainer(snapshot, index, _pagecontroller, context) {
  List answers = [];
  answers.add(snapshot.data?.docs[index]["Answer1"]);
  answers.add(snapshot.data?.docs[index]["Answer2"]);
  answers.add(snapshot.data?.docs[index]["Answer3"]);
  answers.add(snapshot.data?.docs[index]["Answer4"]);
  answers.shuffle();
  return SingleChildScrollView(
    child: Container(
        margin: EdgeInsets.only(top: setSize(context, 50)),
        alignment: Alignment.center,
        child: Column(
          children: [
            questionNumberContainer(context, index, snapshot),
            dividerLineContainer(context),
            questionContainer(context, index, snapshot),
            listViewPageView(answers,context),
            submitButtonPageView(
                context, _pagecontroller, answers, snapshot, index),
          ],
        )),
  );
}
