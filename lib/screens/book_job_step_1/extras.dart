import 'package:flutter/material.dart';
import "package:cleaning_app/config/theme_colors.dart";

class Extras extends StatelessWidget {
  final List<Map> values;
  final List<int> selected;
  final Function onSelect;

  Extras(
      {@required this.values,
      @required this.selected,
      @required this.onSelect});

  Widget renderButton(double size, Map item) {
    final bool active = selected.contains(item["id"]);

    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.4),
      child: Material(
        color: active ? ThemeColors.yellow : ThemeColors.lightGrey,
        child: InkWell(
          onTap: () {
            onSelect(item);
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: size * 0.07),
              width: size,
              height: size,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      item["name"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double constraintedMaxWidth = constraints.maxWidth;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...values
              .map((e) => renderButton(constraintedMaxWidth * 0.32, e))
              .toList()
        ],
      );
    });
  }
}
