import 'package:flutter/material.dart';
import 'package:glean_cookbook/home/home.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:glean_cookbook/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // uncomment when using firebase emulator
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
  // firestore.useFirestoreEmulator("localhost", 8080);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lightGreen,
        ).copyWith(
          secondary: Colors.brown,
        ),
      ),
    );
  }
}
