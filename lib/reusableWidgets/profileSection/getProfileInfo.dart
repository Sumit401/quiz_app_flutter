import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String exp = "";
String about = "";

getProfileInfo(providerValue) async {
  String? userName = FirebaseAuth.instance.currentUser?.email.toString();
  var fireAuth =
      FirebaseFirestore.instance.collection("users").doc(userName).get();
  fireAuth.then((value1) => value1.data()?.forEach((key, value) {
        if (key == "experience") {
          providerValue.getExperience(value);
        } else if (key == "about") {
          providerValue.getAbout(value);
        } else if (key == "qualification") {
          providerValue.getQualification(value);
        } else if (key == "contact") {
          providerValue.getUserPhone(value);
        } else if (key == "userType") {
          providerValue.getUserType(value);
        } else if (key == "name") {
          providerValue.getUserName(value);
        }
      }));
}
