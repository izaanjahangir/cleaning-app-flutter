import 'package:cleaning_app/screens/home/home.dart';
import 'package:cleaning_app/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/components/app_drawer/app_drawer_header.dart';
import 'package:cleaning_app/components/app_drawer/app_drawer_item.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    String currentRoute = ModalRoute.of(context).settings.name;

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
              active: currentRoute == Home.screenName,
              label: "Home",
              onTap: () {
                Navigator.pushNamed(context, Home.screenName);
              },
            ),
            AppDrawerItem(
              active: currentRoute == Profile.screenName,
              label: "Profile",
              onTap: () {
                Navigator.pushNamed(context, Profile.screenName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
