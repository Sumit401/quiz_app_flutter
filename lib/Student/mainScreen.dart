import 'package:flutter/material.dart';

import '../reusableWidgets/appBar.dart';
import 'navigationDrawer/drawerMain.dart';
import 'assignedTeachers/teachersAssigned.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithLogout(context,"Student HomeScreen"),
      drawer: navigationDrawerStudent(context),
      body: teachersAssigned(context),
    );
  }
}
