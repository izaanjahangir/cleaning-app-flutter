import 'package:flutter/material.dart';
import "package:cleaning_app/screens/login/login.dart";
import "package:cleaning_app/screens/home/home.dart";
import "package:cleaning_app/screens/book_job_step_1/book_job_step_1.dart";
import "package:cleaning_app/screens/book_job_step_2/book_job_step_2.dart";
import "package:cleaning_app/screens/your_jobs/your_jobs.dart";
import "package:cleaning_app/screens/settings/settings.dart";
import "package:cleaning_app/screens/profile/profile.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Login.screenName,
      routes: {
        Login.screenName: (context) => Login(),
        Home.screenName: (context) => Home(),
        BookJobStep1.screenName: (context) => BookJobStep1(),
        BookJobStep2.screenName: (context) => BookJobStep2(),
        YourJobs.screenName: (context) => YourJobs(),
        Settings.screenName: (context) => Settings(),
        Profile.screenName: (context) => Profile(),
      },
    );
  }
}
