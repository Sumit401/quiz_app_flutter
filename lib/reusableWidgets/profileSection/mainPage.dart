import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../reusableWidgets/appBar.dart';
import '../Responsive.dart';
import 'profilePageContent/emailContent.dart';
import 'profilePageContent/nameContent.dart';
import 'profilePageContent/userDescriptionContent.dart';
import 'profilePageContent/userExp_And_Qual_Content.dart';
import 'profilePageContent/userImageContent.dart';
import 'profilePageContent/userPhoneContent.dart';
import 'provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // Get firebase logged in user name......................................
    String? userName =
        FirebaseAuth.instance.currentUser?.displayName.toString();
    return Scaffold(
      appBar: appBarSimple(context, "Welcome $userName"),
      body: Consumer<ProfilePageProvider>(
        builder: (context, providerValue, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                userImageContent(context),
                userNameContent(context),
                containerSeperator(context),
                userEmailContent(context),
                containerSeperator(context),
                userPhoneContent(context,providerValue),
                containerSeperator(context),
                providerValue.userType != "0" ? userExperienceContent(context, providerValue) : Container(),
                providerValue.userType != "0" ? containerSeperator(context) : Container(),
                userQualificationContent(context, providerValue),
                containerSeperator(context),
                userDescriptionContent(context, providerValue),
              ],
            ),
          );
        },
      ),
    );
  }
}

containerSeperator(context) {
  return Container(
      width: screenWidth(context), height: 1, color: Colors.black54);
}
