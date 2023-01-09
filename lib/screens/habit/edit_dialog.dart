import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dahae_mobile/models/day_of_week.dart';

const List<Widget> days = <Widget>[
  Text('월'),
  Text('화'),
  Text('수'),
  Text('목'),
  Text('금'),
  Text('토'),
  Text('일')
];

List<bool> _isSelectedDay = [false, false, false, true, false, true, false];

class EditDialog extends StatefulWidget {
  final String title;
  final List<DayOfWeek> days;
  final String action;
  final int value;
  final String unit;
  final DateTime startDate;
  final DateTime endDate;

  // final String title, descriptions, text;
  // final Image img;

  const EditDialog({
    super.key,
    required this.title,
    required this.days,
    required this.action,
    required this.value,
    required this.unit,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  bool timeSet = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(15.0),
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      // width: max(MediaQuery.of(context).size.width, 350),
      height: MediaQuery.of(context).size.height - 400,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(width: 2, color: Theme.of(context).highlightColor),
        color: Theme.of(context).backgroundColor.withOpacity(0.5),
      ),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBox(context, "title"),
          const SizedBox(height: 5), // spacing
          daysBox(context),
          const SizedBox(height: 5), // spacing
          detailBox(context),
          Divider(
            thickness: 1,
            height: 1,
            color: Theme.of(context).primaryColor.withOpacity(0.7),
          ),
          periodBox(context),
        ],
      ),
    );
  }

  textBox(context, width, right, hintText) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, right, 5),
      height: 30.0,
      width: width,
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: Theme.of(context).backgroundColor,
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  dayButton(List<bool> _isSelected) {
    return ToggleButtons(
      onPressed: (int index) {
        // All buttons are selectable.
        setState(() {
          _isSelected[index] = !_isSelected[index];
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.green[700],
      selectedColor: Colors.white,
      fillColor: Colors.green[200],
      color: Colors.green[400],
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 20.0,
      ),
      isSelected: _isSelected,
      children: days,
    );
  }

  titleBox(context, inputTitle) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 166, 180, 255)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Container(
            color: Colors.green,
            padding: const EdgeInsets.only(right: 40),
            child: TextField(
              decoration: InputDecoration(
                hintText: inputTitle,
              ),
            ),
          )
        ],
      ),
    );
  }

  daysBox(context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        children: [
          Text(
            "실천 요일 *",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          dayButton(_isSelectedDay)
        ],
      ),
    );
  }

  detailBox(context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "해빗 상세정보 *",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          textBox(context, 170.0, 14.0, "temp"),
          Row(
            children: [
              textBox(context, 60.0, 10.0, "temp"),
              textBox(context, 60.0, 0.0, "temp"),
            ],
          ),
        ],
      ),
    );
  }

  periodBox(context) {
    return Container(
      color: Colors.cyan,
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "실천 기간",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBox(context, 100.0, 0.0, "temp"),
              Text(
                "~",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              textBox(context, 100.0, 0.0, "temp"),
            ],
          ),
          Row(
            children: [
              textBox(context, 140.0, 10.0, "temp"),
              CupertinoSwitch(
                value: timeSet,
                onChanged: (value) => setState(() => timeSet = !timeSet),
              )
            ],
          )
        ],
      ),
    );
  }
}
