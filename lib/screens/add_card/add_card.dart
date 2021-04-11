import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/components/text_input/text_input.dart';
import 'package:cleaning_app/components/date_input/date_input.dart';
import 'package:cleaning_app/config/keys.dart';
import 'package:cleaning_app/utils/date_helpers.dart';
import 'package:cleaning_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_payment/stripe_payment.dart' as Stripe;

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

  addCard() async {
    try {
      DateTime expiryDate = DateHelpers.toDateTime(card.expiryDate);

      Stripe.StripePayment.setOptions(Stripe.StripeOptions(
        publishableKey: Keys.stripePublishableKey,
      ));

      Stripe.CreditCard cc = Stripe.CreditCard(
          number: card.number,
          name: card.holderName,
          cvc: card.cvv,
          expMonth: expiryDate.month,
          expYear: expiryDate.year);

      Stripe.Token token = await Stripe.StripePayment.createTokenWithCard(cc);
      print(token.tokenId);
      print(token.card.brand);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Helpers.dismissKeyboardOnTap(context);
        },
        child: Scaffold(
          body: Column(
            children: [
              AppHeader(
                showBackIcon: true,
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
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  child: Button(
                                      onPressed: () {
                                        addCard();
                                      },
                                      label: "Add Card"))
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
