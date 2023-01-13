import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constants/constantString.dart';

Widget termsConditions() {
  return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
              text: 'By continuing, you agree to our ',
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrlString(termsConditionsURL);
                      },
                    text: 'Terms & Conditions',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    )),
                TextSpan(
                    text: ' and ',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrlString(privacyPolicyURL);
                          },
                        text: 'Privacy Policy',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      )
                    ])
              ])));
}
