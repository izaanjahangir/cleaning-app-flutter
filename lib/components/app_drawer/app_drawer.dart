import 'package:flutter/material.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/components/app_drawer/app_drawer_header.dart';
import 'package:cleaning_app/components/app_drawer/app_drawer_item.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.6,
      child: Container(
        color: ThemeColors.blue,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          children: [
            AppDrawerHeader(),
            SizedBox(
              height: 10,
            ),
            AppDrawerItem(
              label: "Home",
              onTap: () {
                // Navigator.restorablePush(context, (context, arguments) => null)
              },
            ),
          ],
        ),
      ),
    );
  }
}
