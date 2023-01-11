import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../reusableWidgets/Responsive.dart';
import '../providers/RegisterPageProvider.dart';

Widget toggleForStudentFaculty() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: EdgeInsets.only(top: setSize(context, 20),bottom: setSize(context, 10)),
        child: ToggleSwitch(
          cornerRadius: 15,
          fontSize: setSize(context, 18),
          activeBgColor: const [Colors.green],
          borderWidth: setSize(context, 5),
          animate: true,
          minWidth: setSize(context, 130),
          animationDuration: 400,
          initialLabelIndex: providerValue.radioForStudentFaculty,
          totalSwitches: 2,
          labels: const ['Student',"Faculty"],
          onToggle: (index) {
            print('switched to: $index');
            providerValue.changeStudentFacultyValue(index);
          },
        ),
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