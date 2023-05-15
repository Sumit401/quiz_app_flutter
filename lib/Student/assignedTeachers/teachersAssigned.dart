import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/createColor.dart';
import 'cardView.dart';

Widget teachersAssigned(context) {
  // FireBase Snapshot to create instance of Users Collection............................
  var fireStore = FirebaseFirestore.instance.collection("users").snapshots();

  return StreamBuilder(
    stream: fireStore,
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }

      // check if snapshot data is null..............................
      if ((snapshot.data?.docs.length).toString() == "null" ||
          (snapshot.data?.docs.length).toString() == "0") {
        return Container(
            alignment: Alignment.center,
            child: Text(
              "You have not been Assigned Any Quiz\n Please Check back later.!",
              style: TextStyle(
                  height: 1.5,
                  fontSize: setSize(context, 23),
                  color: hexToColor("#263300"),
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                  wordSpacing: 2,
                  letterSpacing: 0.4),
              textAlign: TextAlign.center,
            ));
      } else {
        // If not null create List View of the following ......................
        final validData = snapshot.data?.docs
            .where((d) => d['userType'] == "1" && d['about'] != "" &&  d['attempt']> 0).toList();



        return ResponsiveWidget.isSmallScreen(context)
            ? ListView.builder(
                itemCount: validData?.length,
                itemBuilder: (context, index) {
                  return cardWidget(validData, index, "List");
                },
              )
            : GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ResponsiveWidget.isMediumScreen(context) ? 2 : 3,
                    mainAxisExtent: screenHeight(context) / 1.5),
                itemCount: validData?.length,
                itemBuilder: (context, index) {
                  return cardWidget(validData, index, "Grid");
                },
              );
      }
    },
  );
}
