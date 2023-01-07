import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/drawerHeading.dart';
import 'drawerBody.dart';



Drawer navigationDrawerStudent(context)
{
  return Drawer(
    elevation: 20,
    width: screenWidth(context)/1.6,
    child: SingleChildScrollView(
      child: Column(
        children: [
          drawerHeader(),
          listTileMyQuiz(),
          listTileCheckScore(),
          listTileProfile(),
          listTileAbout(),
          listTileShare(),
        ],
      ),
    ),
  );
}