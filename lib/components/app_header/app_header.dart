import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class AppHeader extends StatelessWidget {
  final bool showBackIcon;

  AppHeader({this.showBackIcon = false});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      color: ThemeColors.blue,
      width: double.infinity,
      height: height * 0.08,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Stack(
        children: [
          if (showBackIcon)
            TouchableOpacity(
              onTap: () {
                Navigator.of(context).pop();
              },
              activeOpacity: 0.1,
              child: Icon(
                Icons.arrow_back,
                size: height * 0.05,
                color: ThemeColors.white,
              ),
            ),
          Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/icons/app-logo.png",
                ),
              ))
        ],
      ),
    );
  }
}
