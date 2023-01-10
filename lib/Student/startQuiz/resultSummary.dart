import 'package:flutter/material.dart';

import '../../reusableWidgets/appBar.dart';

class ResultSummary extends StatefulWidget {
  const ResultSummary({Key? key}) : super(key: key);

  @override
  State<ResultSummary> createState() => _ResultSummaryState();
}

class _ResultSummaryState extends State<ResultSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple(context,"Your Score"),
      body: Container(child: Text(""),),
    );
  }
}
