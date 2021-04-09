import 'package:cleaning_app/components/app_drawer/app_drawer.dart';
import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/screens/add_card/add_card.dart';
import 'package:cleaning_app/screens/book_job_step_3/details.dart';
import 'package:cleaning_app/screens/book_job_step_3/select_card_section.dart';
import 'package:cleaning_app/screens/book_job_step_4/book_job_step_4.dart';
import 'package:cleaning_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import 'package:touchable_opacity/touchable_opacity.dart';

class BookJobStep3 extends StatefulWidget {
  static String screenName = "book-job-step-3";

  @override
  _BookJobStep3State createState() => _BookJobStep3State();
}

class _BookJobStep3State extends State<BookJobStep3> {
  List<Map> cards = [
    {"id": 0, "number": "4111111111111111", "holderName": "izaan jahangir"},
    {"id": 1, "number": "4111111111111111", "holderName": "izaan jahangir"},
    {"id": 2, "number": "4111111111111111", "holderName": "izaan jahangir"},
  ];
  Map selectedCard;

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Helpers.dismissKeyboardOnTap(context);
        },
        child: Scaffold(
          drawer: AppDrawer(),
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
                            "Step 3 of 3",
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
                                Details(),
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
                            Navigator.of(context)
                                .pushNamed(BookJobStep4.screenName);
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
