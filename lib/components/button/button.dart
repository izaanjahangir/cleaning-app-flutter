import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String label;
  final bool disabled;

  Button(
      {@required this.onPressed, @required this.label, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: Opacity(
        opacity: disabled ? 0.4 : 1,
        child: ElevatedButton(
          onPressed: onPressed,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              label,
              style: TextStyle(color: ThemeColors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
