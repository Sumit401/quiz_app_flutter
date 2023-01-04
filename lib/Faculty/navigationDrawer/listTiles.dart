import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/createQuiz/mainScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

ListTile listTileQuiz(){
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 20),
    leading: const Icon(FontAwesomeIcons.receipt,
        size: 20, color: Colors.black),
    title: const Text(
      "My Quiz",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () => {},
  );
}

ListTile listTileCreate(context){
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(FontAwesomeIcons.circlePlus,size: 20,
        color: Colors.black),
    title: const Text(
      "Create Quiz",
      style: TextStyle(fontSize: 15,
        fontWeight: FontWeight.w400,),
    ),
    onTap: () => {
      Navigator.pop(context),
      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateQuiz(),))
    },
  );
}

ListTile listTileProfile(){
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(FontAwesomeIcons.userLarge,size: 20,
        color: Colors.black),
    title: const Text("My Profile",
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    ),
    onTap: () => {
    },
  );
}

ListTile listTileAbout(){
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(FontAwesomeIcons.circleInfo,size: 20,
        color: Colors.black),
    title: const Text("About Us",
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    ),
    onTap: () => {
    },
  );
}

ListTile listTileShare(){
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(FontAwesomeIcons.shareNodes,size: 20,
        color: Colors.black),
    title: const Text("Share",
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    ),
    onTap: () => {
    },
  );
}