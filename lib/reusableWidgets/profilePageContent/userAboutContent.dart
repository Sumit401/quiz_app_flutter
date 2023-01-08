
import 'package:flutter/material.dart';

import '../Responsive.dart';

Widget userDescriptionContent(context, providerValue) {
  return Container(
    padding: contentPadding(context),
    child: Column(
      children: [
        containerHeading(context,"Your Description"),
        textForHeading(providerValue.about, context),
      ],
    ),
  );
}
Widget userExperienceContent(context, providerValue)  {
  return Container(
    padding: contentPadding(context),
    child: Column(
      children: [
        containerHeading(context,"Experience"),
        textForHeading(providerValue.experience, context),
      ],
    ),
  );
}
Widget userQualificationContent(context, providerValue) {
  return Container(
    padding: contentPadding(context),
    child: Column(
      children: [
        containerHeading(context,"Qualification"),
        textForHeading(providerValue.qualification, context),
      ],
    ),
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

Container containerHeading(context,value) {
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
