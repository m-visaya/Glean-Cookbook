// ignore_for_file: prefer_const_constructors
import 'package:glean_cookbook/views/home.dart';
import 'package:glean_cookbook/views/login.dart';
import 'package:glean_cookbook/views/signup.dart';
import 'dependencies/splashscreen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
        loadingText: Text("Loading"),
        seconds: 1,
        navigateAfterSeconds: const SignupScreen(),
        useLoader: false,
        title: Text(""),
        backgroundColor: Colors.white,
        loadingTextPadding: EdgeInsets.all(0),
        styleTextUnderTheLoader: TextStyle(),
        image: Image.asset("images/splash.gif"),
        photoSize: 150,
      ),
    );
  }
}
