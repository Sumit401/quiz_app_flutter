import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

Widget textFieldEmail(){
  return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Consumer<LoginPageProvider>(
        builder: (context, providerValue, child) {
          return TextFormField(
              decoration: inputTextDecoration("Email"),
              onChanged: (value) {
                providerValue.emailNotifier(value);
              },
              style: textStyleLabel());
        },
      )
  );
}

Widget textFieldPassword(){
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Consumer<LoginPageProvider>(
      builder: (context, providerValue, child) {
        return TextFormField(
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

InputDecoration inputTextDecoration(String value){
  return InputDecoration(
    contentPadding: const EdgeInsets.all(20),
    labelText: value,
    labelStyle: textStyleLabel(),
    focusColor: Colors.white,
    focusedBorder:textFieldBorder(),
    enabledBorder: textFieldBorder(),);
}

OutlineInputBorder textFieldBorder(){
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
      gapPadding: 5);
}
TextStyle textStyleLabel(){
  return const TextStyle(color: Colors.white);
}