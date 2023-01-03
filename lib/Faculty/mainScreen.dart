import 'package:flutter/material.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({Key? key}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage")),
      body: Container(),
    );
  }
}
