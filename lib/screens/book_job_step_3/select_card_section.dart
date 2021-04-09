import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/utils/formatter.dart';
import "package:flutter/material.dart";

class SelectCardSection extends StatelessWidget {
  final List<Map> cards;
  final Map selected;
  final Function onSelect;

  SelectCardSection({this.cards, this.selected, @required this.onSelect});

  Widget renderCard(Map item) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
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
            child: Row(
              children: [
                AbsorbPointer(
                  child: Radio(
                    value: item["id"],
                    groupValue: selected == null ? null : selected["id"],
                    onChanged: (value) {
                      int selectedIndex =
                          cards.indexWhere((element) => element["id"] == value);

                      onSelect(cards[selectedIndex]);
                    },
                  ),
                ),
                Text(
                  Formatter.formatCreditCard(item["number"]),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [...cards.map((e) => renderCard(e)).toList()],
      ),
    );
  }
}
