import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/loginPageProvider.dart';

// Text Field for Email.....................................
Widget textFieldEmail() {
  return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Consumer<LoginPageProvider>(
        builder: (context, providerValue, child) {
          return TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: inputTextDecoration("Email"),
              onChanged: (value) {
                providerValue.emailNotifier(value);
              },
              validator: (value) {
                const pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
                if (value!.trimLeft().length < 3) {
                  if (RegExp(r'[\s]').hasMatch(value)) {
                    return "Email must not contain spaces";
                  }
                  return "Please enter a valid Email";
                } else if (!RegExp(pattern).hasMatch(value)) {
                  return "Please enter a valid Email";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: textStyleLabel());

        },
      ));
}

// Text Field for password.....................................
Widget textFieldPassword() {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Consumer<LoginPageProvider>(
      builder: (context, providerValue, child) {
        return TextFormField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          style: textStyleLabel(),
          decoration: inputTextDecoration("Password"),
          onChanged: (value) {
            providerValue.passwordNotifier(value);
          },
        );
      },
    ),
  );
}

// Input Decoration for above TextFormFields.....................
InputDecoration inputTextDecoration(String value) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(20),
    labelText: value,
    labelStyle: textStyleLabel(),
    focusColor: Colors.white,
    focusedBorder: textFieldBorder(),
    enabledBorder: textFieldBorder(),
    errorBorder: textFieldBorder(),
    focusedErrorBorder: textFieldBorder(),
    errorStyle: TextStyle(fontSize: 14),
    border: textFieldBorder(),
  );
}

// Border for above TextFormFields...............................
OutlineInputBorder textFieldBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
      gapPadding: 5);
}

// Text Styling for above TextFormFields.........................
TextStyle textStyleLabel() {
  return const TextStyle(color: Colors.white);
}
