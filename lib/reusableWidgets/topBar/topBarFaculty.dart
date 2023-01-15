import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../Faculty/Students Result/mainPage.dart';
import '../../Faculty/createQuiz/mainScreen.dart';
import '../../Faculty/mainScreen.dart';
import '../../aboutPage/mainPage.dart';
import '../../constants/constantString.dart';
import '../Responsive.dart';
import '../alertDialogs/alertDialogLogout.dart';
import '../profileSection/mainPage.dart';

class TopBarFaculty extends StatelessWidget {
  const TopBarFaculty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment.center,
      width: screenWidth(context),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 35),
              child: const Text("Champ Quizz",
                  style: TextStyle(color: Colors.white, fontSize: 25))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyHome()));
                    },
                    child: const Text("My Quiz",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateQuiz()));
                    },
                    child: const Text("Create Quiz",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const StudentResult()));
                    },
                    child: const Text("Check Score",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
                  },
                  child: const Text("My Profile",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
                  },
                  child: const Text("About Us",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () async {
                    await launchUrlString(privacyPolicyURL);
                  },
                  child: const Text("Privacy Policy",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              IconButton(onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return alertDialogSignOut(context);
                  },
                );
              }, icon: const Icon(FontAwesomeIcons.rightFromBracket,color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }
}
