import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/utils/date_helpers.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:touchable_opacity/touchable_opacity.dart';

class DateInput extends StatefulWidget {
  final DateTime date;
  final Function onDateSelect;
  final DateTime initialDateTime;

  DateInput({this.date, @required this.onDateSelect, this.initialDateTime});

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  DateTime localDate;

  Widget _buildBottomPicker(BuildContext context) {
    return Container(
      height: 230.0,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TouchableOpacity(
                    onTap: () {
                      handleCancel(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 16,
                          color: ThemeColors.black,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none),
                    )),
                TouchableOpacity(
                    onTap: () {
                      handleConfirm(context);
                    },
                    child: Text("Confirm",
                        style: TextStyle(
                            fontSize: 16,
                            color: ThemeColors.black,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none))),
              ],
            ),
          ),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: widget.initialDateTime == null
                  ? DateTime.now()
                  : widget.initialDateTime,
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  localDate = newDateTime;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void handleCancel(BuildContext context) {
    closePicker(context);
  }

  void handleConfirm(BuildContext context) {
    if (localDate == null && widget.initialDateTime != null) {
      localDate = widget.initialDateTime;
    }

    if (localDate == null && widget.initialDateTime == null) {
      localDate = DateTime.now();
    }

    if (widget.onDateSelect != null) {
      widget.onDateSelect(localDate);
    }

    closePicker(context);
  }

  void openPicker(
    BuildContext context,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return _buildBottomPicker(context);
      },
    );
  }

  void closePicker(
    BuildContext context,
  ) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    String dateToDisplay = DateHelpers.format(widget.date);

    return GestureDetector(
      onTap: () {
        openPicker(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        width: double.infinity,
        height: 42,
        decoration: BoxDecoration(
            color: ThemeColors.white,
            border: Border.all(color: ThemeColors.black, width: 0.7),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: Align(
          child: dateToDisplay == null
              ? Text(
                  "Expiry Date",
                  style:
                      TextStyle(fontSize: 16, color: ThemeColors.placeholder),
                )
              : Text(
                  dateToDisplay,
                  style: TextStyle(fontSize: 16, color: ThemeColors.black),
                ),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
