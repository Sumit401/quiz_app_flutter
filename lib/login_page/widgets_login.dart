import 'package:flutter/material.dart';
import 'package:flutter_project/provider.dart';
import 'package:flutter_project/register_page/register_page.dart';
import 'package:provider/provider.dart';

Widget textFieldEmail(){
  return Padding(
    padding: EdgeInsets.all(12.0),
    child: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            labelText: "Email",
            labelStyle: TextStyle(color: Colors.white),
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                gapPadding: 5),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                gapPadding: 5),),
        style: const TextStyle(color: Colors.white)),
  );
}

Widget textFieldPassword(){
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.white),
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                gapPadding: 5),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                gapPadding: 5)),
        style: TextStyle(color: Colors.white)),
  );
}


Widget notUserSignup(context){
  return InkWell(
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text("Not a User? Click here SignUp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20)),
    ),
    onTap: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
    },
  );
}

Widget submitButton() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: ElevatedButton(
      onPressed: () => null,
      style: ButtonStyle(
        alignment: Alignment.center,
          backgroundColor: const MaterialStatePropertyAll(Colors.blueAccent),
          elevation: const MaterialStatePropertyAll(10),
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 15,vertical: 5)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: const Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
    ),
  );
}

Widget toggleButtons() {
  List<bool> selections = [true, false];
  return ChangeNotifierProvider<ToggleButtonProvider>(
    create: (context) => ToggleButtonProvider(),
    child: Consumer<ToggleButtonProvider>(
      builder: (context, value, child) {
        return ToggleButtons(
            borderRadius: BorderRadius.circular(20),
            borderWidth: 2,
            fillColor: Colors.green,
            selectedColor: Colors.green,
            splashColor: Colors.lightGreen,
            selectedBorderColor: Colors.green,
            borderColor: Colors.white,
            onPressed: (newindex) {
              value.checkIndex(newindex);
              if (value.buttonIndex == 0) {
                selections[0] = true;
                selections[1] = false;
              } else {
                selections[0] = false;
                selections[1] = true;
              }
            },
            isSelected: selections,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: const Text("Student",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15))),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: const Text("Faculty",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15)))
            ]);
      },
    ),
  );
}