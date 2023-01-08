import 'package:flutter/material.dart';

import '../Responsive.dart';
import 'dialogBoxToUpdate.dart';

Widget userDescriptionContent(context, providerValue) {
  return InkWell(
    child: Container(
      padding: contentPadding(context),
      child: Column(
        children: [
          containerHeading(context, "Your Description"),
          providerValue.about == "" ? textForHeading("No Data Available", context) : textForHeading(providerValue.about, context),
        ],
      ),
    ),
    onTap: () {
      createDialogBoxUpdate(context, providerValue, "Your Description");
    },
  );
}

Widget userExperienceContent(context, providerValue) {
  return InkWell(
    child: Container(
      padding: contentPadding(context),
      child: Column(
        children: [
          containerHeading(context, "Experience"),
          providerValue.experience == "" ? textForHeading("No Data Available", context)  : textForHeading(providerValue.experience, context),
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
      padding: contentPadding(context),
      child: Column(
        children: [
          containerHeading(context, "Qualification"),
          providerValue.qualification == "" ? textForHeading("No Data Available", context) : textForHeading(providerValue.qualification, context),
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
        fontSize: setSize(context, 14),
        fontWeight: FontWeight.w300,
        color: Colors.black,
        overflow: TextOverflow.visible),
    textAlign: TextAlign.justify,
  );
}

Container containerHeading(context, value) {
  return Container(
      padding: EdgeInsets.only(bottom: setSize(context, 7)),
      child: Text(value,
          style: TextStyle(
              fontSize: setSize(context, 20),
              color: Colors.black,
              fontWeight: FontWeight.w500)));
}

EdgeInsets contentPadding(context) {
  return EdgeInsets.only(
      left: setSize(context, 20),
      right: setSize(context, 20),
      top: setSize(context, 20));
}
