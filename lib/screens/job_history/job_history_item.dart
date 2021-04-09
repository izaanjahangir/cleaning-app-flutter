import 'package:cleaning_app/models/job.dart';
import "package:flutter/material.dart";
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class JobHistoryItem extends StatelessWidget {
  final Job item;
  final Function onTab;

  JobHistoryItem({@required this.item, @required this.onTab});

  Widget renderDateChip() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: ThemeColors.blue,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Text("01-March-2021",
            style: TextStyle(
              fontSize: 10,
              color: ThemeColors.white,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ThemeColors.lightGrey, width: 1)),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 1,
        color: ThemeColors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            onTab(item);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.ref,
                    style: TextStyle(
                        color: ThemeColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                renderDateChip(),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
