import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/login_page/mainScreen.dart';
import 'package:flutter_project/login_page/provider.dart';
import 'package:flutter_project/register_page/provider.dart';
import 'package:provider/provider.dart';

void main() async{
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
        ChangeNotifierProvider(create: (_) => RegisterPageProvider(),),
        ChangeNotifierProvider(create: (_) => LoginPageProvider(),)
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