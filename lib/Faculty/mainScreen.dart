import 'package:flutter/material.dart';

import '../reusableWidgets/appBar.dart';
import 'floatingButton.dart';
import 'navigationDrawer/drawerMain.dart';
import 'showQuiz/mainScreen.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({Key? key}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithLogout(context,"My Quizzes"),
      floatingActionButton: floatingButtonCreate(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: navigationDrawer(context),
      body: showQuiz(context),
    );
  }
}
