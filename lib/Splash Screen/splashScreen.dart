import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


import '../Faculty/mainScreen.dart';
import '../Student/mainScreen.dart';
import '../constants/constantString.dart';
import '../registerPage/mainScreen.dart';
import '../reusableWidgets/Responsive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    String? email = FirebaseAuth.instance.currentUser?.email.toString();
    var firestore = FirebaseFirestore.instance.collection("users").doc(email).get();
    return FutureBuilder(
      future: firestore,
      builder: (context, snapshot) {
        return Scaffold(
            body:  AnimatedSplashScreen(
              splashIconSize: screenHeight(context),
              splash: Container(
                color: Colors.white30,
                alignment: Alignment.bottomCenter,
                child: Image.asset(splashImg,fit: BoxFit.fitWidth),
              ),
              splashTransition: SplashTransition.fadeTransition,
              animationDuration: const Duration(seconds: 2),
              duration: 1000,
              nextScreen: nextScreen(snapshot),
            )
        );
      },
    );
  }

  Widget nextScreen(AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    String userType = "";
    if(snapshot.hasData){
      snapshot.data?.data()?.forEach((key, value) {
        if(key == "userType"){
          value=="0" ? userType="Student" : userType="Faculty";
        }
      });
    }
    return userType == "Student " ? const StudentHome() : userType=="Faculty" ? const FacultyHome() : const Register();
  }

}
