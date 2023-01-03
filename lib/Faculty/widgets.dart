import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar appBarContent() {
  return AppBar(
    title: const Text("Faculty"),
    centerTitle: true,
    elevation: 10,
    actions: [
      Container(
          padding: const EdgeInsets.only(right: 10),
          child: const Icon(FontAwesomeIcons.ellipsisVertical))
    ],
    backgroundColor: Colors.blueGrey,
  );
}
