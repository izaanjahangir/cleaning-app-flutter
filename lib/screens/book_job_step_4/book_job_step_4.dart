import 'dart:async';

import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/models/job.dart';
import 'package:cleaning_app/providers/user_provider.dart';
import 'package:cleaning_app/screens/add_card/add_card.dart';
import 'package:cleaning_app/screens/book_job_step_4/details.dart';
import 'package:cleaning_app/screens/book_job_step_4/select_card_section.dart';
import 'package:cleaning_app/screens/home/home.dart';
import 'package:cleaning_app/utils/api.dart';
import 'package:cleaning_app/utils/firebase.dart';
import 'package:cleaning_app/utils/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class BookJobStep4 extends StatefulWidget {
  static String screenName = "book-job-step-4";

  @override
  _BookJobStep4State createState() => _BookJobStep4State();
}

class _BookJobStep4State extends State<BookJobStep4> {
  List<Map> cards = [];
  Map selectedCard;
  StreamSubscription ss;

  Widget renderChipButton(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: ThemeColors.blue,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AddCard.screenName);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              children: [
                Text("Add More",
                    style: TextStyle(fontSize: 10, color: ThemeColors.white)),
                TouchableOpacity(
                    child: Icon(
                  Icons.add,
                  size: 14,
                  color: ThemeColors.white,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    cardsListener();

    super.initState();
  }

  cardsListener() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userUid = prefs.getString("userUid");

    Stream collectionStream = FirebaseFirestore.instance
        .collection('cards')
        .where("user", isEqualTo: userUid)
        .orderBy("addedOn", descending: true)
        .snapshots();
    ss = collectionStream.listen((querySnapshot) {
      QuerySnapshot qs = querySnapshot;
      List<Map> newCards = [];

      qs.docs.asMap().forEach((key, value) {
        Map data = value.data();

        Map newCard = {
          "id": value.id,
          "number": data["last4"],
          "holderName": "izaan jahangir",
          "brand": data["brand"],
          "expiryMonth": data["expiryMonth"],
          "expiryYear": data["expiryYear"]
        };

        newCards.add(newCard);
      });

      setState(() {
        cards = newCards;
      });
    });
  }

  @override
  void dispose() {
    ss.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // UserProvider userProvider = Provider.of<UserProvider>(context);

    final Map<String, dynamic> arguments =
        ModalRoute.of(context).settings.arguments;
    final Job job = Job(
        noOfBedrooms: arguments["amount"],
        instructions: arguments["instructions"],
        extras: arguments["selectedExtras"],
        location: {
          "latitude": arguments["location"]["latitude"],
          "longitude": arguments["location"]["longitude"],
        },
        time: arguments["jobTime"]);

    // void handleConfirm() async {
    //   try {
    //     EasyLoading.show(status: 'loading');
    //     Map<String, dynamic> payload = {
    //       "location":
    //           GeoPoint(job.location["latitude"], job.location["longitude"]),
    //       "instructions": job.instructions,
    //       "extras": job.extras,
    //       "noOfBedrooms": job.noOfBedrooms,
    //       "time": job.time,
    //       "addedOn": Timestamp.now()
    //     };
    //     await FirebaseHelpers.addDocument("jobs", payload);
    //     EasyLoading.dismiss();
    //     EasyLoading.showSuccess("Job added");
    //   } catch (e) {
    //     print(e);
    //     EasyLoading.showError(e["message"]);
    //   }
    // }

    handleSubmit() async {
      try {
        EasyLoading.show(status: 'loading');
        Map body = {
          "card": selectedCard["id"],
          "location": {
            "latitude": job.location["latitude"],
            "longitude": job.location["longitude"]
          },
          "instructions": job.instructions,
          "extras": job.extras,
          "noOfBedrooms": job.noOfBedrooms,
          "time": job.time.toIso8601String(),
          "amount": 10
        };

        await Api.pay(body);
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Success");

        Navigator.of(context).pushNamedAndRemoveUntil(
            Home.screenName, (Route<dynamic> route) => false);
      } catch (e) {
        EasyLoading.showError(e["message"]);
      }
    }

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Helpers.dismissKeyboardOnTap(context);
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                AppHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Step 4 of 4",
                            style: TextStyle(
                                fontSize: 20,
                                color: ThemeColors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("Pay Details",
                              style: TextStyle(
                                  fontSize: 26,
                                  color: ThemeColors.blue,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Details(data: job),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pay via card",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    renderChipButton(context)
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SelectCardSection(
                                  cards: cards,
                                  selected: selectedCard,
                                  onSelect: (Map selectedItem) {
                                    setState(() {
                                      selectedCard = selectedItem;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          label: "Back"),
                      Button(
                          onPressed: () {
                            handleSubmit();
                          },
                          label: "Confirm")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
