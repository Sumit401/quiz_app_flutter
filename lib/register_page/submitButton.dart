import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../login_page/mainScreen.dart';
import 'provider.dart';
import 'widgets.dart';

Widget buttonSubmit() {
  return Consumer<RegisterPageProvider>(
    builder: (context, value, child) {
      return ElevatedButton(
          style: const ButtonStyle(elevation: MaterialStatePropertyAll(20)),
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus(); // To remove Keyboard
            showAlertDialog(context); // To show Alert Loading Dialog Box
            try {
              UserCredential result = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                  email: value.email,
                  password: value.password);
              result.user?.updateDisplayName(value.name);

              Map<String,String> userdata={
                "name":value.name,
                "userType" : value.radioForStudentFaculty.toString(),
                "userCourse": value.radioCourseType.toString(),
              };
              FirebaseFirestore.instance.collection("users").doc(value.email).set(userdata);
              long_flutter_toast("Successfully Registered");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));

            } catch(e){
              Navigator.pop(context);
              switchcase_error(e);
            }
          },
          child: const Text(
            "Submit",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ));
    },
  ) ;
}


switchcase_error(e){
  switch (e.code) {
    case "email-already-in-use":
      long_flutter_toast("Your Email is already Registered.");
      break;
    case "invalid-email":
      long_flutter_toast("Enter Valid Email");
      break;
    case "weak-password":
      long_flutter_toast("Password should be at least 6 characters");
      break;
    default:
      long_flutter_toast("An undefined Error happened.");
  };
}

showAlertDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Container(margin: const EdgeInsets.only(left: 20),child:Text("Loading")),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}
