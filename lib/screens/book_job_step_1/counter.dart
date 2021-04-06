import 'package:flutter/material.dart';
import "package:cleaning_app/config/theme_colors.dart";

class Counter extends StatelessWidget {
  final int amount;
  final Function onAdd;
  final Function onSubstract;

  Counter({this.amount = 0, this.onAdd, this.onSubstract});

  Widget renderButton(double size, Widget child, {onTab}) {
    return InkWell(
      borderRadius: BorderRadius.circular(size),
      onTap: onTab,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: ThemeColors.lightGrey,
        ),
        child: Container(
          width: size,
          height: size,
          child: Center(child: child),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AbsorbPointer(
          absorbing: amount <= 0,
          child: renderButton(
              width * 0.1,
              Icon(
                Icons.remove,
                size: width * 0.08,
              ),
              onTab: onSubstract),
        ),
        AbsorbPointer(
          child: renderButton(
              width * 0.2,
              Text(
                amount.toString(),
                style: TextStyle(
                    fontSize: width * 0.075, fontWeight: FontWeight.bold),
              )),
        ),
        AbsorbPointer(
          absorbing: false,
          child: renderButton(
              width * 0.1,
              Icon(
                Icons.add,
                size: width * 0.08,
              ),
              onTab: onAdd),
        )
      ],
    );
  }
}
