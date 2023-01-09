import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dahae_mobile/models/day_of_week.dart';
import '../../models/habit.dart';

// const List<Widget> days = <Widget>[
//   Text('월'),
//   Text('화'),
//   Text('수'),
//   Text('목'),
//   Text('금'),
//   Text('토'),
//   Text('일')
// ];

List<String> weekdays = ["월", "화", "수", "목", "금", "토", "일"];

//List<bool> _isSelectedDay = [false, false, false, true, false, true, false];

class EditDialog extends StatefulWidget {
  // final String title, descriptions, text;
  // final Image img;

  final Habit habit;

  const EditDialog({super.key, required this.habit
      // required this.title,
      // required this.days,
      // required this.action,
      // required this.value,
      // required this.unit,
      // required this.startDate,
      // required this.endDate,
      });

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  bool timeSet = false;

  List<bool> daysToBool(days) {
    return [false, false, false, true, false, true, false];
  }

  @override
  Widget build(BuildContext context) {
    double dialogWidth = MediaQuery.of(context).size.width;

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      //insetPadding: const EdgeInsets.all(15.0),
      child: contentBox(
          context,
          widget.habit.title,
          widget.habit.days,
          widget.habit.action,
          widget.habit.value,
          widget.habit.unit,
          widget.habit.startDate,
          widget.habit.endDate),
    );
  }

  contentBox(context, String title, List<DayOfWeek> days, String action,
      int value, String unit, DateTime startDate, DateTime endDate) {
    return Container(
        // width: max(MediaQuery.of(context).size.width, 350),
        // height: MediaQuery.of(context).size.height * 3 / 5,
        width: 350,
        height: 450,
        //padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(width: 2, color: Theme.of(context).highlightColor),
          color: Theme.of(context).backgroundColor.withOpacity(0.5),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleBox(context, title),
                    //const SizedBox(height: 5), // spacing
                    daysBox(context, days),
                    //const SizedBox(height: 5), // spacing
                    detailBox(context, action, value, unit),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                    ),
                    periodBox(context, startDate, endDate),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: Color(0xFF925FF0),
                ),
              ),
            ),
          ],
        ));
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
      renderBorder: false,
      onPressed: (int index) {
        // All buttons are selectable.
        setState(() {
          _isSelected[index] = !_isSelected[index];
        });
      },
      constraints: const BoxConstraints(
        maxWidth: 320,
      ),
      isSelected: _isSelected,
      // borderRadius: const BorderRadius.all(Radius.circular(8)),
      // selectedBorderColor: Theme.of(context).highlightColor,
      // selectedColor: Theme.of(context).backgroundColor,
      fillColor: Theme.of(context).backgroundColor.withOpacity(0.5),
      children: List<Widget>.generate(
        7,
        (index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              color: _isSelected[index]
                  ? Theme.of(context).focusColor
                  : Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(18),
            ),
            width: 36,
            height: 36,
            alignment: Alignment.center,
            child: Text(
              weekdays[index],
              style: _isSelected[index]
                  ? const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700)
                  : TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      // disabledColor: ,
      // color: Colors.black,
      // constraints: const BoxConstraints(
      //   minHeight: 40.0,
      //   minWidth: 20.0,
      // ),
      // isSelected: _isSelected,
      // //children: days,
    );
  }

  titleBox(context, inputTitle) {
    return Container(
      //decoration: BoxDecoration(color: Color.fromARGB(255, 166, 180, 255)),
      margin: const EdgeInsets.only(top: 20, right: 25),
      child: Container(
        //color: Colors.white54,
        height: 35,
        //padding: const EdgeInsets.only(right: 40),
        child: TextField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).backgroundColor,
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).highlightColor,
                  width: 2,
                ),
              ),
              hintText: inputTitle,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor)),
        ),
      ),
    );
  }

  daysBox(context, days) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "실천 요일 *",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            child: dayButton(daysToBool(days)),
          )
        ],
      ),
    );
  }

  detailBox(context, action, value, unit) {
    return Container(
      //color: Colors.amber,
      margin: const EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "해빗 상세정보 *",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 12),
          textBox(context, 200.0, 14.0, action),
          Row(
            children: [
              textBox(context, 80.0, 10.0, value.toString()),
              textBox(context, 80.0, 0.0, unit),
            ],
          ),
        ],
      ),
    );
  }

  periodBox(context, startDate, endDate) {
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
              textBox(context, 130.0, 0.0, startDate.toString()),
              Text(
                "~",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              textBox(context, 130.0, 0.0, endDate.toString()),
            ],
          ),
          Row(
            children: [
              textBox(context, 250.0, 10.0, startDate.toString()),
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
