import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../providers/RegisterPageProvider.dart';
import '../reusableWidgets/Responsive.dart';

Widget toggleForStudentFaculty() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: EdgeInsets.only(
            top: setSize(context, 20), bottom: setSize(context, 10)),
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
          labels: const ['Student', "Faculty"],
          onToggle: (index) {
            providerValue.changeStudentFacultyValue(index);
          },
        ),
      );
    },
  );
}
