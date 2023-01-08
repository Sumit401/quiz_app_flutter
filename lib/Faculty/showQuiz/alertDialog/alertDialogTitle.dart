
import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';

Container titleOfAlertDialog(context,index,snapshot) {
  return Container(
    padding: const EdgeInsets.all(10),
    width: screenWidth(context)*0.75,
    child: Column(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
                snapshot.data.docs[index]['Quiz Title'].toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: setSize(context, 20), fontWeight: FontWeight.w800))),
        Container(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Text("Description: ",
                style: TextStyle(
                    fontSize: setSize(context, 18), fontWeight: FontWeight.w600))),
        Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
                snapshot.data.docs[index]['Quiz Description'].toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: setSize(context, 18), fontWeight: FontWeight.w400))),

        Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text("Difficulty : ${snapshot.data.docs[index]['Difficulty'].toString()}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: setSize(context, 18), fontWeight: FontWeight.w600))),
        Container(
            child: Text("Total Questions : ${snapshot.data.docs[index]['Total Questions'].toString()}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: setSize(context, 18), fontWeight: FontWeight.w600))),
      ],
    ),
  );
}