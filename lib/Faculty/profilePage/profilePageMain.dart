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
    String? userName =
        FirebaseAuth.instance.currentUser?.displayName.toString();
    return Scaffold(
      appBar: appBarSimple(context, "Welcome $userName"),
      body: Consumer<FacultyProfilePageProvider>(
        builder: (context, providerValue, child) {
          return Column(
            children: [
              userImageProfile(context),
              //userNameProfile(context),
              userEmailContent(context),
              userDescriptionContent(context, providerValue),
              userExperienceContent(context, providerValue),
              userQualificationContent(context, providerValue),
            ],
          );
        },
      ),
    );
  }
}
