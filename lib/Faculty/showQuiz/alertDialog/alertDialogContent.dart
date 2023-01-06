
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget contentOfAlertDialog(context,index,snapshot){
  String? email = FirebaseAuth.instance.currentUser?.email.toString();
  var firestoreSnapshots =FirebaseFirestore.instance.collection("users").doc(email).collection("questions").doc("${snapshot.data.docs[index].id}").collection("${snapshot.data.docs[index].id}").snapshots();

  return SizedBox(
    height: 300,
    width: double.maxFinite,
    child: StreamBuilder(
        stream: firestoreSnapshots,
        builder: (context, snapshot2) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot2.data?.docs.length,
            itemBuilder: (context, index2) {
              if(!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Question #${index2+1}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                    Text("${snapshot2.data?.docs[index2]['Question'].toString()} ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text("A.) ${snapshot2.data?.docs[index2]['Answer1'].toString()}",textAlign: TextAlign.center,
                            overflow: TextOverflow.visible),
                        ),
                        Expanded(
                          child: Text("B.) ${snapshot2.data?.docs[index2]['Answer2'].toString()}",textAlign: TextAlign.center,
                            overflow: TextOverflow.visible),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Expanded(
                            child: Text("C.) ${snapshot2.data?.docs[index2]['Answer3'].toString()}",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              "D.) ${snapshot2.data?.docs[index2]['Answer4'].toString()}",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
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