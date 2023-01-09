import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dahae_mobile/models/day_of_week.dart';

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

  textBox(context, width, right, hintText) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, right, 5),
      height: 25.0,
      width: width,
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Theme.of(context).backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  contentBox(context) {
    return Container(
      // width: max(MediaQuery.of(context).size.width, 350),
      //height: MediaQuery.of(context).size.height - 200,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(width: 2, color: Theme.of(context).highlightColor),
        color: Theme.of(context).backgroundColor.withOpacity(0.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: "해빗 네임",
            ),
          ),
          Column(
            children: [
              Text(
                "실천 요일 *",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const Text("M T W T F S S"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "해빗 상세정보 *",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              //textBox(context, 170.0, 0.0,),
              Row(
                children: [
                  textBox(context, 60.0, 10.0, "temp"),
                  textBox(context, 60.0, 0.0, "temp"),
                ],
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: Theme.of(context).primaryColor.withOpacity(0.7),
              ),
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
        ],
      ),
    );
  }
}
