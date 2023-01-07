import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../reusableWidgets/Responsive.dart';

ListTile listTileMyQuiz(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 20),
    leading:
        const Icon(FontAwesomeIcons.receipt, size: 20, color: Colors.black),
    title: Text(
      "My Quiz",
      style: TextStyle(
        fontSize: setFontSize(context, 17),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () => {},
  );
}

ListTile listTileCheckScore(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:Icon(FontAwesomeIcons.squarePollVertical,
        size: setFontSize(context, 17), color: Colors.black),
    title: Text(
      "Check My Score",
      style: TextStyle(
        fontSize: setFontSize(context, 17),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () => {},
  );
}

ListTile listTileProfile(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.userLarge, size: 20, color: Colors.black),
    title:  Text(
      "My Profile",
      style: TextStyle(fontSize: setFontSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () => {},
  );
}

ListTile listTileAbout(context) {
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.circleInfo, size: 20, color: Colors.black),
    title: Text(
      "About Us",
      style: TextStyle(fontSize: setFontSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () => {},
  );
}

ListTile listTileShare(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.shareNodes, size: 20, color: Colors.black),
    title: Text(
      "Share",
      style: TextStyle(fontSize: setFontSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () => {},
  );
}
