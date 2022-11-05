import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  late var onChange;
  String label;
  bool isObscure;

  InputField(
      {Key? key,
      required this.onChange,
      required this.label,
      this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLength: 30,
        cursorColor: Colors.green,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.green),
          counterText: "",
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.green,
            ),
          ),
        ),
        obscureText: isObscure,
        onChanged: onChange);
  }
}
