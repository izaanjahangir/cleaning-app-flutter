import 'package:flutter/material.dart';
import "package:cleaning_app/screens/login/login.dart";
import "package:cleaning_app/screens/home/home.dart";
import "package:cleaning_app/screens/book_job_step_1/book_job_step_1.dart";
import "package:cleaning_app/screens/book_job_step_2/book_job_step_2.dart";
import "package:cleaning_app/screens/book_job_step_3/book_job_step_3.dart";
import "package:cleaning_app/screens/job_history/job_history.dart";
import "package:cleaning_app/screens/job_history_details/job_history_details.dart";
import "package:cleaning_app/screens/book_job_step_4/book_job_step_4.dart";
import "package:cleaning_app/screens/settings/settings.dart";
import "package:cleaning_app/screens/profile/profile.dart";
import "package:cleaning_app/screens/add_card/add_card.dart";

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
        BookJobStep3.screenName: (context) => BookJobStep3(),
        BookJobStep4.screenName: (context) => BookJobStep4(),
        JobHistory.screenName: (context) => JobHistory(),
        JobHistoryDetails.screenName: (context) => JobHistoryDetails(),
        Settings.screenName: (context) => Settings(),
        Profile.screenName: (context) => Profile(),
        AddCard.screenName: (context) => AddCard(),
      },
    );
  }
}
