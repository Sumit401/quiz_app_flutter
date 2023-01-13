import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Responsive.dart';

// Container for user Image
Container userImageContent(context) {
  String? imageUrl = FirebaseAuth.instance.currentUser?.photoURL.toString();
  if (imageUrl == "null") {
    return Container(
      margin: EdgeInsets.only(
          top: setSize(context, 40), bottom: setSize(context, 7)),
      child: Image.asset(
        "assets/images/user_img.png",
        height: 100,
        width: 100,
      ),
    );
  } else {
    return Container(
      margin: EdgeInsets.only(
          top: setSize(context, 40), bottom: setSize(context, 7)),
      child: Image.network(
        imageUrl!,
        height: 100,
        width: 100,
      ),
    );
  }
}
