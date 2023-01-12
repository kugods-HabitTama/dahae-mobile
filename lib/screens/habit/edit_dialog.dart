import 'dart:math';

import 'package:dahae_mobile/screens/habit/dialog/day_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dahae_mobile/models/day_of_week.dart';
import '../../models/habit.dart';

// inner Boxes
import './dialog/text_box.dart';
import './dialog/title_box.dart';
import './dialog/days_box.dart';
import './dialog/detail_box.dart';
import './dialog/period_box.dart';

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

  const EditDialog({super.key, required this.habit});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  bool timeSet = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

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
        height: 500,
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
                    TitleBox(
                      inputTitle: title,
                    ),
                    //const SizedBox(height: 5), // spacing
                    DaysBox(days: days),
                    //const SizedBox(height: 5), // spacing
                    detailBox(action: action, value: value, unit: unit),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                    ),
                    PeriodBox(startDate: startDate, endDate: endDate),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // 완료 눌렀을 때 DB에 data update 되도록 마저 구현하기
                            },
                            child: Text(
                              "완료",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          )
                        ],
                      ),
                    ),
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

  // daysBox(context, days) {
  //   return Container(
  //     margin: const EdgeInsets.only(
  //       top: 20,
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           "실천 요일 *",
  //           style: Theme.of(context).textTheme.subtitle2,
  //         ),
  //         const SizedBox(height: 10),
  //         Container(
  //           alignment: Alignment.center,
  //           child: DayButtons(isSelected: daysToBool(days)),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
