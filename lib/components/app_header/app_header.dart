import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class AppHeader extends StatelessWidget {
  final bool showBackIcon;
  final bool showLogoutIcon;
  final Function onLogoutPress;

  AppHeader(
      {this.showBackIcon = false,
      this.showLogoutIcon = true,
      this.onLogoutPress});

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
              )),
          if (showLogoutIcon)
            Align(
              alignment: Alignment.centerRight,
              child: TouchableOpacity(
                  onTap: () {
                    if (onLogoutPress != null) {
                      onLogoutPress();
                    } else {
                      Navigator.of(context).popUntil((route) {
                        return route.settings.name == Login.screenName;
                      });
                    }
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 18, color: ThemeColors.white),
                  )),
            )
        ],
      ),
    );
  }
}
