import 'package:cleaning_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import "package:cleaning_app/screens/login/login.dart";
import "package:cleaning_app/screens/register/register.dart";
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
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ChangeNotifierProvider(
            create: (ctx) => UserProvider(),
            child: MaterialApp(
              title: 'Flutter Demo',
              builder: EasyLoading.init(),
              initialRoute: Login.screenName,
              routes: {
                Login.screenName: (context) => Login(),
                Register.screenName: (context) => Register(),
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
            ),
          );
        }

        return Container();
      },
    );
  }
}
