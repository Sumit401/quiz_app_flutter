import 'package:flutter/material.dart';

import '../../Responsive.dart';
import 'dialogBoxUpdateDatabase.dart';

Widget userDescriptionContent(context, providerValue) {
  return InkWell(
    child: Container(
      padding: EdgeInsets.all(setSize(context, 10)),
      child: Column(
        children: [
          headingDescription(context, "Your Description"),
          providerValue.about == ""
              ? contentDescription("Tap to Update", context)
              : contentDescription(providerValue.about, context),
        ],
      ),
    ),
    onTap: () {
      createDialogBoxUpdate(context, providerValue, "Your Description");
    },
  );
}

Text contentDescription(providerValue, context) {
  return Text(
    providerValue,
    style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
        color: Colors.black,
        overflow: TextOverflow.visible),
    textAlign: TextAlign.justify,
  );
}

Container headingDescription(context, value) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: setSize(context, 10)),
      child: Text(value,
          style: TextStyle(
              fontSize: setSize(context, 20),
              color: Colors.black,
              fontWeight: FontWeight.w500)));
}
