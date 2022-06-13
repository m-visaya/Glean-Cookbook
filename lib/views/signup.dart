// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glean_cookbook/views/home.dart';
import 'package:glean_cookbook/views/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Wrap(
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 50,
            direction: Axis.vertical,
            children: <Widget>[
              SvgPicture.asset(
                'images/logo_full.svg',
                height: 200,
              ),
              SizedBox(
                width: 290,
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Wrap(
                  spacing: 20,
                  direction: Axis.vertical,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TextButton(
                      child: Text('Create Account'),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.lightGreen.shade600,
                          onSurface: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          minimumSize: Size(200, 50)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
