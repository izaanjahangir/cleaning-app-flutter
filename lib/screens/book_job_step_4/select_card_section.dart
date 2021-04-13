import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/utils/formatter.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class SelectCardSection extends StatelessWidget {
  final List<Map> cards;
  final Map selected;
  final Function onSelect;

  SelectCardSection({this.cards, this.selected, @required this.onSelect});

  Widget renderCard(Map item, int index) {
    String expiryMonth = item["expiryMonth"].toString();

    if (expiryMonth.length < 2) {
      expiryMonth = "0" + expiryMonth;
    }

    String expiryYear = item["expiryYear"].toString().substring(0, 2);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Container(
              decoration: BoxDecoration(
                  color: ThemeColors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              margin: index == 0
                  ? const EdgeInsets.only(top: 0)
                  : const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text("Expires on: $expiryMonth/$expiryYear",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ThemeColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ThemeColors.black, width: 0.5)),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(10),
              color: ThemeColors.white,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  onSelect(item);
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      AbsorbPointer(
                        child: Radio(
                          value: item["id"],
                          groupValue: selected == null ? null : selected["id"],
                          onChanged: (value) {
                            int selectedIndex = cards.indexWhere(
                                (element) => element["id"] == value);

                            onSelect(cards[selectedIndex]);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          Formatter.maskCreditCard(item["number"]),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      if (item["brand"] == "mastercard")
                        SvgPicture.asset("assets/icons/mastercard.svg",
                            width: 25, semanticsLabel: 'Acme Logo')
                      else if (item["brand"] == "visa")
                        SvgPicture.asset("assets/icons/visa.svg",
                            width: 25, semanticsLabel: 'Acme Logo')
                      else
                        SvgPicture.asset("assets/icons/credit-card.svg",
                            width: 25, semanticsLabel: 'Acme Logo')
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          ...cards
              .asMap()
              .entries
              .map((e) => renderCard(e.value, e.key))
              .toList()
        ],
      ),
    );
  }
}
