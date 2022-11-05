import 'package:flutter/material.dart';

class ButtonFill extends StatelessWidget {
  var onPress;
  String label;

  ButtonFill({Key? key, required this.onPress, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.lightGreen.shade600,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPress,
      child: SizedBox(
          width: 150,
          child: Text(
            label,
            textAlign: TextAlign.center,
          )),
    );
  }
}

class ButtonText extends StatelessWidget {
  late String label;
  late String route;
  ButtonText({Key? key, required this.label, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade700),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
