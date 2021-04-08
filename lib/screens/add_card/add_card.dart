import 'package:cleaning_app/components/app_drawer/app_drawer.dart';
import 'package:cleaning_app/components/text_input/text_input.dart';
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
  CreditCard card = new CreditCard();

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
                          showBackView:
                              false, //true when you want to show cvv(back) view
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
                                    child: TextInput(
                                      maxLength: 16,
                                      controller: numberController,
                                      hintText: "Number",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextInput(
                                      maxLength: 16,
                                      controller: numberController,
                                      hintText: "Number",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextInput(
                                maxLength: 16,
                                controller: numberController,
                                hintText: "Number",
                              )
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
