import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/createColor.dart';
import 'cardView.dart';

Widget teachersAssigned(context){

  // FireBase Snapshot to create instance of Users Collection............................
  var fireStore = FirebaseFirestore.instance.collection("users").snapshots();

  return StreamBuilder(
    stream: fireStore,
    builder: (context, snapshot) {

      // check if snapshot data is null..............................
      if ((snapshot.data?.docs.length).toString() == "null" ||
          (snapshot.data?.docs.length).toString() == "0") {
        return Container(
            alignment: Alignment.center,
            child: Text(
              "You have been Assigned Any Quiz\n Please Check back later.!",
              style: TextStyle(
                  fontSize: setSize(context, 23),
                  color: hexToColor("#263300"),
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                  wordSpacing: 2,
                  letterSpacing: 0.4),
              textAlign: TextAlign.center,
            ));
      }else {
        // If not null create List View of the following ......................
        return ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (context, index) {

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            // Card widget of faculty name, about and experience.................
            if (snapshot.data?.docs[index]["userType"] == "1" &&
                snapshot.data?.docs[index]["about"] != "") {
              return cardWidget(snapshot, index);
            } else {
              return Container();
            }
          },
        );
      }
    },
  );
}