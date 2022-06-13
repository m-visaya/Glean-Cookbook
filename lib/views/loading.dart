import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import '../dependencies/splashscreen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      loadingText: Text("Loading"),
      seconds: 1,
      navigateAfterSeconds: const LoadingScreen(),
      useLoader: false,
      title: Text(""),
      backgroundColor: Colors.white,
      loadingTextPadding: EdgeInsets.all(0),
      styleTextUnderTheLoader: TextStyle(),
      image: Image.asset("images/splash.gif"),
      photoSize: 150,
    );
  }
}
