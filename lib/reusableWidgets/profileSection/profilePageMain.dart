import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../reusableWidgets/appBar.dart';
import '../../reusableWidgets/profilePageContent/emailAndNameContent.dart';
import '../../reusableWidgets/profilePageContent/userAboutContent.dart';
import '../../reusableWidgets/profilePageContent/userImageContent.dart';
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
    String? userName = FirebaseAuth.instance.currentUser?.displayName.toString();
    return Scaffold(
      appBar: appBarSimple(context, "Welcome $userName"),
      body: Consumer<ProfilePageProvider>(
        builder: (context, providerValue, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                userImageContent(context),
                userNameContent(context),
                userEmailContent(context),
                userDescriptionContent(context, providerValue),
                userExperienceContent(context, providerValue),
                userQualificationContent(context, providerValue),
              ],
            ),
          );
        },
      ),
    );
  }
}
