import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/appBar.dart';
import '../../reusableWidgets/createColor.dart';
import '../../reusableWidgets/topBar/topBarFaculty.dart';
import 'checkScoreList.dart';

class StudentResult extends StatefulWidget {
  const StudentResult({Key? key}) : super(key: key);

  @override
  State<StudentResult> createState() => _StudentResultState();
}

class _StudentResultState extends State<StudentResult> {
  @override
  Widget build(BuildContext context) {
    var firestore = FirebaseFirestore.instance.collection("users").snapshots();

    return Scaffold(
        appBar: ResponsiveWidget.isLargeScreen(context)
            ? PreferredSize(
            preferredSize: Size(screenWidth(context), 70),
            child: const TopBarFaculty())
            : appBarSimple(context, "Score"),

        body: Center(
          child: SizedBox(
            child: Center(
              child: StreamBuilder(
                stream: firestore,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if ((snapshot.data?.docs.length).toString() == "null" ||
                      (snapshot.data?.docs.length).toString() == "0") {
                    return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "No Candidate to Display !",
                          style: TextStyle(
                              height: 1.5,
                              fontSize: setSize(context, 24),
                              fontWeight: FontWeight.bold,
                              color: hexToColor("#263300"),
                              overflow: TextOverflow.visible,
                              wordSpacing: 2,
                              letterSpacing: 0.4),
                          textAlign: TextAlign.center,
                        ));
                  } else {
                    final validData = snapshot.data?.docs
                        .where((d) => d['userType'] == "0" && d['about'] != "" && d["qualification"] != "")
                        .toList();
                    return ResponsiveWidget.isSmallScreen(context)
                        ? ListView.builder(
                            itemCount: validData?.length,
                            itemBuilder: (context, index) {
                              return checkScoreList(validData, context, index);
                            },
                          )
                        : Center(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          ResponsiveWidget.isMediumScreen(
                                                  context)
                                              ? 2
                                              : 3,
                                      mainAxisExtent:
                                          screenHeight(context) / 2),
                              itemCount: validData?.length,
                              itemBuilder: (context, index) {
                                return checkScoreList(
                                    validData, context, index);
                              },
                            ),
                          );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
