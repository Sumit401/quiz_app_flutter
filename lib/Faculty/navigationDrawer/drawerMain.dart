import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/navigationDrawer/listTiles.dart';

import '../../reusableWidgets/Responsive.dart';
import 'drawerHeading.dart';

Drawer navigationDrawer(context) {
  return Drawer(
    width: screenWidth(context) / 1.6,
    elevation: 20,
    child: SingleChildScrollView(
      child: Column(
        children: [
          drawerHeader(),
          listTileQuiz(),
          listTileCreate(context),
          listTileProfile(),
          listTileAbout(),
          listTileShare(),
        ],
      ),
    ),
  );
}
