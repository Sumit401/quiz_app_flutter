import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';

Widget contentOfAlertDialog(context, index, snapshot) {
  // Get Current User Email..........................
  String? email = FirebaseAuth.instance.currentUser?.email.toString();

  // Get Snapshots of Questions........................
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

              // Set snapshots in String.............................
              String? quest = snapshot2.data?.docs[index2]['Question'].toString();
              String? ans1 = snapshot2.data?.docs[index2]['Answer1'].toString();
              String? ans2 = snapshot2.data?.docs[index2]['Answer2'].toString();
              String? ans3 = snapshot2.data?.docs[index2]['Answer3'].toString();
              String? ans4 = snapshot2.data?.docs[index2]['Answer4'].toString();

              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Question #${index2 + 1}",
                        style: TextStyle(
                            fontSize: setSize(context, 20),
                            fontWeight: FontWeight.w600)),
                    Text(
                      "${quest=="null" ? "" : quest}",
                      style: TextStyle(
                          fontSize: setSize(context, 19),
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        answerContainer("A.) ${ans1=="null" ? "" : ans1}", context),
                        answerContainer("B.) ${ans2=="null" ? "" : ans2}", context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        answerContainer("C.) ${ans3=="null" ? "" : ans3}", context),
                        answerContainer("D.) ${ans4=="null" ? "" : ans4}", context),
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

Widget answerContainer(value, context) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(top: setSize(context, 10)),
      child: Text(
        value,
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
        style: TextStyle(fontSize: setSize(context, 16)),
      ),
    ),
  );
}
