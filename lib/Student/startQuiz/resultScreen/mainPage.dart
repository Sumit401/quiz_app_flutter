import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../../providers/studentProviders/startQuizProvider.dart';
import '../../../providers/studentProviders/studentProvider.dart';
import '../../../reusableWidgets/Responsive.dart';
import '../../../reusableWidgets/appBar.dart';
import 'resultSummaryContent.dart';

class ResultSummary extends StatefulWidget {
  const ResultSummary({Key? key}) : super(key: key);

  @override
  State<ResultSummary> createState() => _ResultSummaryState();
}

class _ResultSummaryState extends State<ResultSummary> {
  final sc_controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSimpleWithoutBack(context, "Your Score"),
        body: Consumer2<StartQuizProvider, StudentProvider>(
          builder: (context, quizValue, studentValue, child) {
            double result = quizValue.totalRight /
                int.parse(studentValue.totalQuestions) *
                100;
            return Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: setSize(context, 30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    shareWidget(result, studentValue, quizValue, context),
                    screenshot(studentValue, quizValue, result, sc_controller,
                        context),
                    homePageNaviagte(context),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
