import 'package:cleaning_app/components/app_drawer/app_drawer.dart';
import 'package:cleaning_app/components/text_input/text_input.dart';
import 'package:cleaning_app/components/date_input/date_input.dart';
import 'package:cleaning_app/utils/date_helpers.dart';
import 'package:cleaning_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/models/credit_card.dart";

class AddCard extends StatefulWidget {
  static String screenName = "add-card";

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController holderNameController = TextEditingController();
  CreditCard card = new CreditCard();
  bool showBackView = false;

  @override
  void initState() {
    numberController.addListener(() {
      setState(() {
        card.number = numberController.text;
      });
    });

    holderNameController.addListener(() {
      setState(() {
        card.holderName = holderNameController.text;
      });
    });

    cvvController.addListener(() {
      setState(() {
        card.cvv = cvvController.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    holderNameController.dispose();
    cvvController.dispose();

    super.dispose();
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
          body: Column(
            children: [
              AppHeader(
                showBackIcon: true,
                showDrawerIcon: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CreditCardWidget(
                          cardNumber: card.number,
                          expiryDate: card.expiryDate,
                          cardHolderName: card.holderName,
                          cvvCode: card.cvv,
                          showBackView: showBackView,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              TextInput(
                                maxLength: 16,
                                controller: numberController,
                                hintText: "Number",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: DateInput(
                                      onDateSelect: (DateTime newDateTime) {
                                        setState(() {
                                          card.expiryDate =
                                              DateHelpers.format(newDateTime);
                                        });
                                      },
                                      date: DateHelpers.toDateTime(
                                          card.expiryDate),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        if (hasFocus) {
                                          setState(() {
                                            showBackView = true;
                                          });
                                        } else {
                                          setState(() {
                                            showBackView = false;
                                          });
                                        }
                                      },
                                      child: TextInput(
                                        maxLength: 3,
                                        controller: cvvController,
                                        hintText: "CVV",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextInput(
                                maxLength: 16,
                                controller: holderNameController,
                                hintText: "Card Holder Name",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
