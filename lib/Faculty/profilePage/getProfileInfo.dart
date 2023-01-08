import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String exp="";
String about="";
getProfileInfo(providervalue) async {

  String? userName = FirebaseAuth.instance.currentUser?.email.toString();
  var fireAuth= FirebaseFirestore.instance.collection("users").doc(userName).get();
  fireAuth.then((value1) => value1.data()?.forEach((key, value)
  {
    if(key=="experience") {
      providervalue.getExperience(value);
    }else if(key=="about") {
      providervalue.getAbout(value);
    }else if(key=="qualification") {
      providervalue.getQualification(value);
    }
  }));
}