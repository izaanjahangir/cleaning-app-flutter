import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      color: ThemeColors.yellow,
      width: double.infinity,
      height: height * 0.08,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                TouchableOpacity(
                  onTap: () {},
                  activeOpacity: 0.1,
                  child: Icon(
                    Icons.menu,
                    size: height * 0.06,
                    color: ThemeColors.black,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icons/app-logo.png",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
