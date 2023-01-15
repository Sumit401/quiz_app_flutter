import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import 'dialogBoxResult.dart';

Widget checkScoreList(snapshot, context, index) {
  // Get Data From Snapshots...................................
  String? docID = snapshot?[index].id;
  String? studName = snapshot?[index]["name"];
  String about = snapshot?[index]["about"];
  String qualification = snapshot?[index]["qualification"];

  return InkWell(
    child: Card(
      elevation: 18,
      shape: cardShape(),
      margin: cardMargin(context),
      child: SingleChildScrollView(
        child: Container(
          padding: containerPadding(context),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              studentName(context, studName),
              aboutStudent(context, about),
              studentQualification(context, qualification),
            ],
          ),
        ),
      ),
    ),
    onTap: () {
      dialogBoxResult(context, docID, studName!);
    },
  );
}

containerPadding(context) {
  return EdgeInsets.symmetric(
      vertical: setSize(context, 20), horizontal: setSize(context, 10));
}

cardMargin(context) {
  return EdgeInsets.symmetric(
      horizontal: setSize(context, 20), vertical: setSize(context, 10));
}

cardShape() {
  return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));
}

studentQualification(context, String qualification) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Qualification :",
          style: TextStyle(
              fontSize: setSize(context, 18), fontWeight: FontWeight.w600)),
      Text(qualification,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: setSize(context, 18), fontWeight: FontWeight.w600)),
    ],
  );
}

aboutStudent(context, String about) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Text(about,
        style: TextStyle(fontSize: setSize(context, 16)),
        textAlign: TextAlign.center),
  );
}

studentName(context, String? studName) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Text(studName!,
        style: TextStyle(
            fontSize: setSize(context, 25), fontWeight: FontWeight.w700)),
  );
}
