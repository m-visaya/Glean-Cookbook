// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      child: Text('Log in'),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.lightGreen.shade600,
                          onSurface: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          minimumSize: Size(150, 50)),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      onPressed: () {},
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
