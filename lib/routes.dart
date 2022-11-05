import 'package:flutter/material.dart';
import 'package:glean_cookbook/home/home.dart';
import 'package:glean_cookbook/favorites/favorites.dart';
import 'package:glean_cookbook/profile/profile.dart';
import 'package:glean_cookbook/login/login.dart';
import 'package:glean_cookbook/login/signup.dart';

Map<String, Widget Function(dynamic)> routes = {
  "home": (context) => HomeScreen(),
  "profile": (context) => Profile(),
  "favorites": (context) => Favorites(),
  "login": (context) => LoginScreen(),
  "signup": (context) => SignupScreen(),
};
