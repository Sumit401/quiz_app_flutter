import 'package:flutter/material.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Quiz"),backgroundColor: Colors.blueGrey,centerTitle: true,),
      //drawer: navigationDrawer(context),
      body: Container(
        child: Column(
          children: [
            TextFormField(decoration: const InputDecoration(labelText: "Quiz Title")),
            TextFormField(decoration: const InputDecoration(labelText: "Quiz Description")),

          ],
        ),
      ),
    );
  }
}
