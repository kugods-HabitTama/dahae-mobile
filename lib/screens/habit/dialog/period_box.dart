import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './text_box.dart';

class PeriodBox extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;

  const PeriodBox({super.key, required this.startDate, required this.endDate});

  @override
  State<PeriodBox> createState() => _PeriodBoxState();
}

class _PeriodBoxState extends State<PeriodBox> {
  bool timeSet = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      //color: Colors.cyan,
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "실천 기간",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBox(
                width: screenWidth / 3,
                rightOffset: 0,
                hintText: widget.startDate.toString(),
              ),
              Text(
                "~",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              TextBox(
                  width: screenWidth / 3,
                  rightOffset: 0,
                  hintText: widget.endDate.toString()),
            ],
          ),
          Row(
            children: [
              TextBox(
                  width: screenWidth / 3 + 40,
                  rightOffset: 10,
                  hintText: widget.startDate.toString()),
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
