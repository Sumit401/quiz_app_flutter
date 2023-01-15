import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Faculty/mainScreen.dart';
import '../Student/mainScreen.dart';
import '../constants/constantString.dart';
import '../registerPage/mainScreen.dart';
import '../reusableWidgets/Responsive.dart';
import '../reusableWidgets/profileSection/getProfileInfo.dart';
import '../reusableWidgets/profileSection/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(body: Consumer<ProfilePageProvider>(
      builder: (context, profileProvider, child) {
        return AnimatedSplashScreen(
          centered: true,
          splashIconSize: screenHeight(context),
          splash: SizedBox(
            width: screenWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 50),
                        height: screenHeight(context) / 10,
                        width: screenHeight(context) / 10,
                        child: const CircularProgressIndicator(strokeWidth: 5)),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: const Text("Please Wait"),
                    )
                  ],
                ),
                Container(
                  color: Colors.white30,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(splashImg, fit: BoxFit.fitWidth, height: screenHeight(context) / 1.5),
                ),
              ],
            ),
          ),
          splashTransition: SplashTransition.fadeTransition,
          animationDuration: const Duration(seconds: 2),
          duration: 1000,
          nextScreen: nextScreen(profileProvider),
        );
      },
    ));
  }

  Widget nextScreen(ProfilePageProvider profileProvider) {
    getProfileInfo(profileProvider);

    return profileProvider.userType == "1"
        ? const FacultyHome()
        : profileProvider.userType == "0"
            ? const StudentHome()
            : const Register();
  }
}
