
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
            child: const Text(
              "Title:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            )),
        Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
                snapshot.data.docs[index]['Quiz Title'].toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600))),
        Container(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: const Text("Description: ",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w800))),
        Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
                snapshot.data.docs[index]['Quiz Description'].toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600))),
      ],
    ),
  );
}