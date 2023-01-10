import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Faculty/createQuiz/provider.dart';
import 'Student/provider.dart';
import 'Student/startQuiz/provider.dart';
import 'loginPage/mainScreen.dart';
import 'loginPage/provider.dart';
import 'registerPage/provider.dart';
import 'reusableWidgets/profileSection/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterPageProvider()),
        ChangeNotifierProvider(create: (_) => LoginPageProvider()),
        ChangeNotifierProvider(create: (_) => CreateQuizProvider()),
        ChangeNotifierProvider(create: (_) => StudentProvider()),
        ChangeNotifierProvider(create: (_) => ProfilePageProvider()),
        ChangeNotifierProvider(create: (_) => StartQuizProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
