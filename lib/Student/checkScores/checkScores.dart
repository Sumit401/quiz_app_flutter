import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/appBar.dart';
import 'scoresList.dart';

class CheckScore extends StatefulWidget {
  const CheckScore({Key? key}) : super(key: key);

  @override
  State<CheckScore> createState() => _CheckScoreState();
}

class _CheckScoreState extends State<CheckScore> {

  @override
  Widget build(BuildContext context) {
    var email = FirebaseAuth.instance.currentUser?.email;
    var firestore= FirebaseFirestore.instance.collection("users").doc(email).collection("answers").snapshots();
    return Scaffold(
      appBar: appBarSimple(context,"My Scores"),
      body: StreamBuilder(
        stream: firestore,
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return GridView.builder(
            physics: const ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: screenHeight(context)/3.5),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
            return scoresList(snapshot,index,context);
          },);
        },
      ),
    );
  }


}
