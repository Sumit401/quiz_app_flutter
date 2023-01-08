import 'package:flutter/material.dart';

import '../reusableWidgets/Responsive.dart';
import 'createQuiz/mainScreen.dart';


Widget floatingButtonCreate(context) {
  return Container(
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1)),
    width: 100,
    height: 45,
    child: floatingButton(context),
  );
}

Widget floatingButton(context) {
  return FloatingActionButton(
    backgroundColor: Colors.blueGrey,
    elevation: 20,
    isExtended: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateQuiz(),)),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add),
          Text("Create",
              style: TextStyle(fontSize: setSize(context, 18), fontWeight: FontWeight.w600)),
        ],
      ),
    ),
  );
}