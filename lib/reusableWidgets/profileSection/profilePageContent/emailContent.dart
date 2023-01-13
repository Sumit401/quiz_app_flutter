import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Responsive.dart';
import 'nameContent.dart';

Widget userEmailContent(context) {
  User? userInfo = FirebaseAuth.instance.currentUser;
  return Container(
    margin: EdgeInsets.only(
        top: setSize(context, 10),
        right: setSize(context, 10),
        left: setSize(context, 10)),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              FontAwesomeIcons.solidEnvelope,
            ),
            Padding(
              padding: EdgeInsets.all(setSize(context, 20)),
              child: textView(context, "Email"),
            ),
          ],
        ),
        Expanded(child: textView(context, userInfo?.email)),
      ],
    ),
  );
}
