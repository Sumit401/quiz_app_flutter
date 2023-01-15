import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Splash Screen/splashScreen.dart';
import 'providers/RegisterPageProvider.dart';
import 'providers/createQuizProvider.dart';
import 'providers/loginPageProvider.dart';
import 'providers/studentProviders/startQuizProvider.dart';
import 'providers/studentProviders/studentProvider.dart';
import 'providers/studentProviders/studentSnapshotProvider.dart';
import 'providers/studentProviders/timerCountDownProvider.dart';
import 'reusableWidgets/profileSection/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /*if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC9eJ9frWsX3ntu57LTUMoc7a0RXG7Xjqg",
            authDomain: "project-41bc9.firebaseapp.com",
            projectId: "project-41bc9",
            storageBucket: "project-41bc9.appspot.com",
            messagingSenderId: "575325391913",
            appId: "1:575325391913:web:2dbaee145ef2b25553a038",
            measurementId: "G-2E1W6WMJWZ"));
  }*/

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
        ChangeNotifierProvider(create: (_) => TimerProvider()),
        ChangeNotifierProvider(create: (_) => SnapshotProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Champ Quizz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
