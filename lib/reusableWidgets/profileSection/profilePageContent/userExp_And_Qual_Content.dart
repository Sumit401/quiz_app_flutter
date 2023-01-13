import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Responsive.dart';
import 'dialogBoxUpdateDatabase.dart';

Widget userExperienceContent(context, providerValue) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.all(setSize(context, 10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FontAwesomeIcons.solidStar, color: Colors.black),
              Padding(
                padding: EdgeInsets.all(setSize(context, 20)),
                child: textForHeading("Experience", context),
              ),
            ],
          ),
          Expanded(
              child: providerValue.experience == ""
                  ? textForHeading("Tap to Update", context)
                  : textForHeading(providerValue.experience, context)),
        ],
      ),
    ),
    onTap: () {
      createDialogBoxUpdate(context, providerValue, "Experience");
    },
  );
}

Widget userQualificationContent(context, providerValue) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.all(setSize(context, 10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FontAwesomeIcons.graduationCap),
              Padding(
                padding: EdgeInsets.all(setSize(context, 20)),
                child: textForHeading("Qualification", context),
              ),
            ],
          ),
          Expanded(
              child: providerValue.qualification == ""
                  ? textForHeading("Tap to Update", context)
                  : textForHeading(providerValue.qualification, context)),
        ],
      ),
    ),
    onTap: () {
      createDialogBoxUpdate(context, providerValue, "Qualification");
    },
  );
}

Text textForHeading(providerValue, context) {
  return Text(
    providerValue,
    style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
        color: Colors.black,
        overflow: TextOverflow.visible),
    textAlign: TextAlign.end,
  );
}
