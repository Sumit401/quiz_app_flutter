import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../reusableWidgets/Responsive.dart';
import 'provider.dart';

Widget toggleForStudentFaculty() {
  return Consumer<RegisterPageProvider>(
    builder: (context, value, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: RadioListTile(
                activeColor: Colors.cyan,
                title: Text("Student",style: TextStyle(fontSize: setFontSize(context,17),color: Colors.white,)),
                value: 0,
                groupValue: value.radioForStudentFaculty,
                onChanged: (changedValue) {
                  value.changeStudentFacultyValue(changedValue);
                },
              )),
          Expanded(
              child: RadioListTile(
                activeColor: Colors.cyan,
                title: Text("Faculty",style: TextStyle(fontSize: setFontSize(context,17), color: Colors.white)),
                value: 1,
                groupValue: value.radioForStudentFaculty,
                onChanged: (changedValue) {
                  value.changeStudentFacultyValue(changedValue);
                },
              )),
        ],
      );
    },

  );
}

/*
Widget selectCourse(){
  return Consumer<RegisterPageProvider>(
    builder: (context, value, child) {
      return Row(
        children: [
          Expanded(
              child: RadioListTile(
                activeColor: Colors.cyan,
                title: Text("Science", style: TextStyle(fontSize: setFontSize(context,17),color: Colors.white)),
                value: 0,
                groupValue: value.radioCourseType,
                onChanged: (radioValue) {
                  value.changeCourseType(radioValue);
                },)),
          Expanded(
              child: RadioListTile(
                activeColor: Colors.cyan,
                title: Text("Commerce", style: TextStyle(fontSize:setFontSize(context,17),color: Colors.white)),
                value: 1,
                groupValue: value.radioCourseType,
                onChanged: (radioValue) {
                  value.changeCourseType(radioValue);
                },
              ))
        ],
      );
    },
  );
}*/
