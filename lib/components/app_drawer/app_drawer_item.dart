import 'package:cleaning_app/components/app_drawer/app_drawer.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  final String label;
  final bool active;
  final Function onTap;

  AppDrawerItem(
      {@required this.label, this.active = false, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: active ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: ThemeColors.lightGrey,
          onTap: onTap,
          child: Container(
              height: 45,
              width: double.infinity,
              child: Center(
                  child: Text(
                label,
                style: TextStyle(
                    fontSize: 18,
                    color: active ? ThemeColors.black : ThemeColors.white),
              ))),
        ),
      ),
    );
  }
}
