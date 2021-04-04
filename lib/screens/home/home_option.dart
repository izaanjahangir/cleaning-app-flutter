import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class HomeOption extends StatelessWidget {
  final String label;

  HomeOption({@required this.label});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return TouchableOpacity(
      child: Container(
        width: width * 0.45,
        height: width * 0.45,
        child: Card(
            elevation: 5,
            child: Center(
                child: Text(
              label,
              style: TextStyle(
                  fontSize: 18,
                  color: ThemeColors.black,
                  fontWeight: FontWeight.bold),
            ))),
      ),
    );
  }
}
