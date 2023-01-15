import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/studentProviders/startQuizProvider.dart';
import '../../../reusableWidgets/Responsive.dart';
import '../../../reusableWidgets/createColor.dart';

Widget listViewPageView(answers,context) {
  return Container(
    width: ResponsiveWidget.isSmallScreen(context) ? screenWidth(context) : screenWidth(context)/2,
    child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, itemIndex) {
          return Consumer<StartQuizProvider>(
            builder: (context, providerValue, child) {
              return InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: providerValue.answerIndex == itemIndex
                          ? Colors.green.shade700
                          : hexToColor("#9393F4"),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(setSize(context, 20)),
                  margin: EdgeInsets.symmetric(
                      vertical: setSize(context, 10),
                      horizontal: setSize(context, 20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${String.fromCharCode((65 + itemIndex))})."),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Text(
                        " ${answers[itemIndex].toString()=="null" ? "" : answers[itemIndex]}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: setSize(context, 17),
                            fontWeight: FontWeight.w500),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  providerValue.getAnswerID(itemIndex);
                },
              );
            },
          );
        }),
  );
}
