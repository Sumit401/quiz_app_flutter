import 'package:flutter/material.dart';

Widget floatingButtonCreate() {
  return Container(
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1)),
    width: 100,
    height: 45,
    child: FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      isExtended: true,
      backgroundColor: Colors.blueGrey,
      onPressed: () => null,
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add),
            Text("Create",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    ),
  );
}