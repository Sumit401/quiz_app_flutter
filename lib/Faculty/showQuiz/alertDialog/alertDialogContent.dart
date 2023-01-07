import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';

Widget contentOfAlertDialog(context, index, snapshot) {
  String? email = FirebaseAuth.instance.currentUser?.email.toString();
  var firestoreSnapshots = FirebaseFirestore.instance
      .collection("users")
      .doc(email)
      .collection("questions")
      .doc("${snapshot.data.docs[index].id}")
      .collection("${snapshot.data.docs[index].id}")
      .snapshots();

  return SizedBox(
    height: screenHeight(context) / 1.8,
    width: screenWidth(context),
    child: StreamBuilder(
        stream: firestoreSnapshots,
        builder: (context, snapshot2) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot2.data?.docs.length,
            itemBuilder: (context, index2) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Question #${index2 + 1}",
                        style: TextStyle(
                            fontSize: setFontSize(context, 20),
                            fontWeight: FontWeight.w600)),
                    Text(
                      "${snapshot2.data?.docs[index2]['Question'].toString()} ",
                      style: TextStyle(
                          fontSize: setFontSize(context, 19),
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        answerValue("A.) ${snapshot2.data?.docs[index2]['Answer1'].toString()}", context),
                        answerValue("B.) ${snapshot2.data?.docs[index2]['Answer2'].toString()}", context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        answerValue("C.) ${snapshot2.data?.docs[index2]['Answer3'].toString()}", context),
                        answerValue("D.) ${snapshot2.data?.docs[index2]['Answer4'].toString()}", context),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }),
  );
}
Widget answerValue(value,context){
  return Expanded(
    child: Text(value,
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
      style: TextStyle(fontSize: setFontSize(context, 16)),
    ),
  );
}