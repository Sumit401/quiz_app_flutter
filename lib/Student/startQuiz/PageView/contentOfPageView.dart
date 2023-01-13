import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';

questionContainer(context, index, snapshot) {
  return Container(
    margin: EdgeInsets.symmetric(
        vertical: setSize(context, 20), horizontal: setSize(context, 20)),
    child: Text("${snapshot.data?.docs[index]["Question"].toString()=="null" ? "" : snapshot.data?.docs[index]["Question"]}",
        style: TextStyle(
            color: Colors.black,
            fontSize: setSize(context, 20),
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.justify),
  );
}

questionNumberContainer(context, index, snapshot) {
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
