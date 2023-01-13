import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Responsive.dart';
import '../provider.dart';
import 'dialogBoxUpadteCurrentUserInfo.dart';

Widget userNameContent(context, ProfilePageProvider providerValue) {
  User? userInfo = FirebaseAuth.instance.currentUser;
  return InkWell(
    child: Container(
        margin: EdgeInsets.only(
            top: setSize(context, 50),
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
                  FontAwesomeIcons.solidCircleUser,
                ),
                Padding(
                  padding: EdgeInsets.all(setSize(context, 20)),
                  child: textView(context, "User Name"),
                ),
              ],
            ),
            Expanded(child: textView(context, providerValue.userName)),
          ],
        )),
    onTap: () {
      dialogBoxUpdateCurrentUserInfo(context, userInfo, "User Name");
    },
  );
}

Widget textView(context, value) {
  return Text(
    value ?? "Tap to Update",
    style: textStyleName(context),
    textAlign: TextAlign.end,
  );
}

TextStyle textStyleName(context) {
  return TextStyle(
      fontSize: setSize(context, 17),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      overflow: TextOverflow.ellipsis);
}
