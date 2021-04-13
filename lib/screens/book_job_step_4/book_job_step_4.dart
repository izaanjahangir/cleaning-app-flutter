import 'dart:async';

import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/models/job.dart';
import 'package:cleaning_app/screens/add_card/add_card.dart';
import 'package:cleaning_app/screens/book_job_step_4/details.dart';
import 'package:cleaning_app/screens/book_job_step_4/select_card_section.dart';
import 'package:cleaning_app/utils/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
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

  cardsListener() {
    Stream collectionStream =
        FirebaseFirestore.instance.collection('cards').snapshots();
    ss = collectionStream.listen((querySnapshot) {
      QuerySnapshot qs = querySnapshot;
      List<Map> newCards = [];

      qs.docs.asMap().forEach((key, value) {
        Map data = value.data();

        Map newCard = {
          "id": value.id,
          "number": data["last4"],
          "holderName": "izaan jahangir",
          "brand": data["brand"]
        };

        newCards.add(newCard);
      });

      setState(() {
        print("setting state");
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
    final Map<String, dynamic> arguments =
        ModalRoute.of(context).settings.arguments;
    final Job job = Job(
        noOfBedrooms: arguments["amount"],
        extras: arguments["selectedExtras"],
        time: arguments["jobTime"]);

    print(arguments["extras"]);

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
                                  height: 10,
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
                            // Navigator.of(context)
                            //     .pushNamed(BookJobStep4.screenName);
                          },
                          label: "Next")
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
