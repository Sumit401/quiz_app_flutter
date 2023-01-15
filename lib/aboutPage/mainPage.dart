import 'package:flutter/material.dart';

import '../constants/constantString.dart';
import '../reusableWidgets/Responsive.dart';
import '../reusableWidgets/appBar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: ResponsiveWidget.isSmallScreen(context) ? Size.fromHeight(screenHeight(context) / 4) : Size.fromHeight(screenHeight(context) / 2.5),
          child: appBarAbout(context)),
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            aboutTitleContainer(),
            aboutContainer(),
          ],
        ),
      ),
    );
  }

  aboutTitleContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      child: Text("About",
          style: TextStyle(
              fontSize: 30,
              color: Colors.cyan.shade800,
              fontWeight: FontWeight.bold)),
    );
  }

  aboutContainer() {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(aboutUsContent,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify),
          ),
        ],
      ),
    );
  }
}
