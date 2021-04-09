import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class AppHeader extends StatelessWidget {
  final bool showBackIcon;
  final bool showDrawerIcon;

  AppHeader({this.showBackIcon = false, this.showDrawerIcon = true});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      color: ThemeColors.blue,
      width: double.infinity,
      height: height * 0.08,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // if (showDrawerIcon)
          //   TouchableOpacity(
          //     onTap: () {
          //       Scaffold.of(context).openDrawer();
          //     },
          //     activeOpacity: 0.1,
          //     child: Icon(
          //       Icons.menu,
          //       size: height * 0.05,
          //       color: ThemeColors.white,
          //     ),
          //   ),
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
          Expanded(
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
