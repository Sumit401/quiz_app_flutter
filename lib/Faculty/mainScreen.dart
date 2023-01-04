import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/navigationDrawer/drawerMain.dart';
import 'package:flutter_project/Faculty/appBar.dart';

import 'floatingButton.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({Key? key}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarContent(context),
      floatingActionButton: floatingButtonCreate(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: navigationDrawer(context),
      body: Container(),
    );
  }
}
