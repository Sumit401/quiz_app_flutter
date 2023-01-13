import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Responsive.dart';
import 'dialogBoxUpdateDatabase.dart';

Widget userPhoneContent(context, providerValue) {
  return InkWell(
    child: Container(
        margin: margin(context),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.phone),
                Padding(
                  padding: EdgeInsets.all(setSize(context, 20)),
                  child: textView("Contact No", context),
                )
              ],
            ),
            Expanded(
                child: providerValue.userPhone == ""
                    ? textView("Tap to Update", context)
                    : textView(providerValue.userPhone, context)),
          ],
        )),
    onTap: () {
      createDialogBoxUpdate(context, providerValue, "Phone");
    },
  );
}

margin(context) {
  return EdgeInsets.only(
      top: setSize(context, 10),
      right: setSize(context, 10),
      left: setSize(context, 10));
}

textView(value, context) {
  return Text(
    value ?? "Tap to Update",
    style: textStyleName(context),
    textAlign: TextAlign.end,
  );
}

textStyleName(context) {
  return TextStyle(
      fontSize: setSize(context, 17),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      overflow: TextOverflow.ellipsis);
}
