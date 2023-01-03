import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/navigationDrawer/mainDrawer.dart';
import 'package:flutter_project/Faculty/widgets.dart';

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
      appBar: appBarContent(),
      floatingActionButton: floatingButtonCreate(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: navigationDrawer(context),
      body: Container(),
    );
  }
}
