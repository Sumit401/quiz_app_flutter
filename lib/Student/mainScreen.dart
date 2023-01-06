import 'package:flutter/material.dart';

import '../reusableWidgets/appBar.dart';
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
      appBar: appBarContent(context,"Student HomeScreen"),
      drawer: navigationDrawerStudent(context),
      body: Container(),
    );
  }
}
