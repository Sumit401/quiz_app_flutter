import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 700;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1000;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 700 &&
        MediaQuery.of(context).size.width <= 1000;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 700) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double setSize(context, size) {
  if (MediaQuery.of(context).size.width <= 400) {
    return size * 0.8;
  } else if (MediaQuery.of(context).size.width >= 400 &&
      MediaQuery.of(context).size.width < 450) {
    return size * 0.94;
  } else if (MediaQuery.of(context).size.width >= 450) {
    return size * 1.0;
  } else {
    return size * 1.0;
  }
}

String getScreenHeight(context) {
  if (MediaQuery.of(context).size.height < 760) {
    return "small";
  } else if (MediaQuery.of(context).size.height >= 760 &&
      MediaQuery.of(context).size.height < 1010) {
    return "medium";
  } else if (MediaQuery.of(context).size.height >= 1010) {
    return "large";
  } else {
    return "large";
  }
}
