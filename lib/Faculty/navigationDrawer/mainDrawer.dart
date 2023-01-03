import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/navigationDrawer/listTiles.dart';

import '../../Responsive.dart';
import 'drawerHeading.dart';

Drawer navigationDrawer(context) {
  return Drawer(
    width: screenWidth(context) / 1.6,
    elevation: 20,
    child: Column(
      children: [
        drawerHeader(),
        listTileQuiz(),
        listTileCreate(),
        listTileProfile(),
        listTileAbout(),
        listTileShare(),
      ],
    ),
  );
}
