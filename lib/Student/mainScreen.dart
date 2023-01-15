import 'package:flutter/material.dart';

import '../reusableWidgets/Responsive.dart';
import '../reusableWidgets/appBar.dart';
import '../reusableWidgets/topBar/topBarStudent.dart';
import 'assignedTeachers/teachersAssigned.dart';
import 'navigationDrawer/drawerMain.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isLargeScreen(context)
          ? PreferredSize(preferredSize: Size(screenWidth(context), 70), child: const TopBarStudent())
          : appBarWithLogout(context, "Student HomeScreen"),
      drawer: navigationDrawerStudent(context),
      body: teachersAssigned(context),
    );
  }
}
