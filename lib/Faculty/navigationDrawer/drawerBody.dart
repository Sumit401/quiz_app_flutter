import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../aboutPage/mainPage.dart';
import '../../constants/constantString.dart';
import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/profileSection/getProfileInfo.dart';
import '../../reusableWidgets/profileSection/mainPage.dart';
import '../../reusableWidgets/profileSection/provider.dart';
import '../Students Result/mainPage.dart';
import '../createQuiz/mainScreen.dart';

ListTile listTileMyQuiz(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 20),
    leading:
        const Icon(FontAwesomeIcons.receipt, size: 20, color: Colors.black),
    title: Text(
      "My Quiz",
      style: TextStyle(
        fontSize: setSize(context, 18),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {},
  );
}

Widget listTileCreate(context) {
  return Consumer<ProfilePageProvider>(
    builder: (context, providerValue, child) {
      return ListTile(
        contentPadding: const EdgeInsets.only(top: 15, left: 20),
        leading: const Icon(FontAwesomeIcons.circlePlus,
            size: 20, color: Colors.black),
        title: Text(
          "Create Quiz",
          style: TextStyle(
            fontSize: setSize(context, 18),
            fontWeight: FontWeight.w400,
          ),
        ),
        onTap: () async {
          Navigator.pop(context);
          await getProfileInfo(providerValue);
          if (providerValue.experience == "" ||
              providerValue.qualification == "" ||
              providerValue.about == "") {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Alert",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  elevation: 20,
                  content: const Text(
                      "Kindly Update Profile Section to Create Quiz"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontSize: 15),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));

                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                );
              },
            );
          } else {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateQuiz(),
                ));
          }
        },
      );
    },
  );
}

Widget listTileProfile(context) {
  return Container(
    child: Consumer<ProfilePageProvider>(
      builder: (context, providerValue, child) {
        return ListTile(
          contentPadding: const EdgeInsets.only(top: 15, left: 20),
          leading: const Icon(FontAwesomeIcons.userPen,
              size: 20, color: Colors.black),
          title: Text(
            "My Profile",
            style: TextStyle(
                fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
          ),
          onTap: () async {
            await getProfileInfo(providerValue);
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
        );
      },
    ),
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
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AboutPage()));
    },
  );
}

listTilePrivacyPolicy(context) {
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.userShield, size: 20, color: Colors.black),
    title: Text(
      "Privacy Policy",
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      Navigator.pop(context);
      await launchUrlString(privacyPolicyURL);
    },
  );
}

listTileTerms(context) {
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(FontAwesomeIcons.bookOpenReader,
        size: 20, color: Colors.black),
    title: Text(
      "Terms and Conditions",
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      await launchUrlString(termsConditionsURL,
          webOnlyWindowName: "Terms And Conditions");
      Navigator.pop(context);
    },
  );
}

ListTile listTileShare(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.shareNodes, size: 20, color: Colors.black),
    title: Text(
      "Share",
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      await launchUrlString(appLink,
      webOnlyWindowName: "App Share");
      Navigator.pop(context);

    },
  );
}

ListTile listTileStudentResult(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(FontAwesomeIcons.squarePollVertical,
        size: 20, color: Colors.black),
    title: Text(
      "Student's Score",
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const StudentResult()));
    },
  );
}
