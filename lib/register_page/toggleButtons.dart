import 'package:flutter/material.dart';
import 'package:flutter_project/register_page/provider.dart';
import 'package:provider/provider.dart';

Widget toggleForStudentFaculty() {
  return Consumer<RegisterPageProvider>(
    builder: (context, value, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: RadioListTile(
                activeColor: Colors.cyan,
                title: Text("Student",style: TextStyle(color: Colors.white)),
                value: 0,
                groupValue: value.radioForStudentFaculty,
                onChanged: (changedValue) {
                  value.changeStudentFacultyValue(changedValue);
                },
              )),
          Expanded(
              child: RadioListTile(
                activeColor: Colors.cyan,
                title: Text("Faculty",style: TextStyle(color: Colors.white)),
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

Widget selectCourse(){
  return Consumer<RegisterPageProvider>(
    builder: (context, value, child) {
      return Row(
        children: [
          Expanded(
              child: RadioListTile(
                activeColor: Colors.cyan,
                title: const Text("Science", style: TextStyle(color: Colors.white)),
                value: 0,
                groupValue: value.radioCourseType,
                onChanged: (radioValue) {
                  value.changeCourseType(radioValue);
                },)),
          Expanded(
              child: RadioListTile(
                activeColor: Colors.cyan,
                title: const Text("Commerce", style: TextStyle(color: Colors.white)),
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
}