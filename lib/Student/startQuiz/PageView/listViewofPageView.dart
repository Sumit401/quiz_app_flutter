
import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';
import '../../../reusableWidgets/createColor.dart';

Widget listViewPageView(providerValue,answers){
  return ListView.builder(
    physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, itemIndex) {
        return InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: providerValue.answerIndex == itemIndex
                    ? Colors.green
                    : hexToColor("#9393F4"),borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(setSize(context, 20)),
            margin: EdgeInsets.symmetric(
                vertical: setSize(context, 10),horizontal: setSize(context, 20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${String.fromCharCode((65 + itemIndex))})."),
                const SizedBox(width: 8),
                Expanded(child: Text(" ${answers[itemIndex]}"))
              ],
            ),
          ),
          onTap: () {
            providerValue.getAnswerID(itemIndex);
          },
        );
      });
}