import 'package:flutter/material.dart';
import 'package:flutter_project/login_page/mainScreen.dart';
import 'package:flutter_project/register_page/provider.dart';
import 'package:provider/provider.dart';

double screenHeight(context){
  return MediaQuery.of(context).size.height;
}
double screenWidth(context){
  return MediaQuery.of(context).size.width;
}

Widget textFieldName(){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: "Name",
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 2))),
    ),
  );
}

Widget textFieldEmail(){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: "Email",
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 2))),
    ),
  );
}

Widget textFieldPassword(){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: "Password",
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 2))),
    ),
  );
}

Widget buttonSubmit() {
  return ElevatedButton(
      onPressed: () => null,
      child: const Text(
        "Submit",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}

Widget alreadyUserLogin(context) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text("Not a User? Click here SignUp",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
    ),
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    },
  );
}

Widget toggleForType() {
  return ChangeNotifierProvider<ProviderToggleType>(
    create: (context) => ProviderToggleType(),
    child: Consumer<ProviderToggleType>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: RadioListTile(
                  activeColor: Colors.green,
                  title: Text("Student",style: TextStyle(color: Colors.white)),
                  value: 0,
                  groupValue: value.selectedRadio,
                  onChanged: (changedValue) {
                    value.changeRadioValue(changedValue);
                    print(value.selectedRadio);
                  },
                )),
            Expanded(
                child: RadioListTile(
                  activeColor: Colors.green,
                  title: Text("Faculty",style: TextStyle(color: Colors.white)),
                  value: 1,
                  groupValue: value.selectedRadio,
                  onChanged: (changedValue) {
                    value.changeRadioValue(changedValue);
                    print(value.selectedRadio);
                  },
                )),
          ],
        );
      },

    ),
  );
}