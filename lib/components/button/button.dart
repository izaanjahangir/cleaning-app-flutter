import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String label;

  Button({@required this.onPressed, @required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
