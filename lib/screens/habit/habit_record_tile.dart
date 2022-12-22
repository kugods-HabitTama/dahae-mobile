import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dahae_mobile/screens/habit/edit_dialog.dart';
import 'dart:math';

// Todo
// HabitRecord 객체를 입력받아 '메인 페이지'에 있는 HabitTile을 구현합니다.
// 클릭하면 입력 필드가 나와서 얼마나 했는지 작성할 수 있어야 합니다.
// 수정버튼을 누르면 내부에 있는 HabitRecord의 Habit을 찾아 해당 Habit을 수정할 수 있는
// 팝업을 띄울 수 있어야 합니다.
class HabitRecordTile extends StatefulWidget {
  final String title;
  //final String progress;
  //final TimeOfDay timeOfDay;

  const HabitRecordTile({
    super.key,
    required this.title,
    //required this.progress,
    //required this.timeOfDay,
  });

  @override
  State<HabitRecordTile> createState() => _HabitRecordTileState();
}

class _HabitRecordTileState extends State<HabitRecordTile> {
  // TimeofDay Type 을 format
  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  bool showTextField = false;
  var percent = NumberFormat("##%");

  @override
  Widget build(BuildContext context) {
    // mockData - temp
    String title = "아침에 30분 요가하기";
    double progress = 0.4;
    const TimeOfDay habitTime = TimeOfDay(hour: 08, minute: 0); // 8:00am
    const String day = "목, 금";
    int value = 30;
    const String unit = "분";

    void submit() {
      Navigator.of(context).pop();
    }

    Future<String?> openDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return EditDialog(
            title: title,
            unit: unit,
            value: value,
          );
        });

    var borderRadius = showTextField
        ? const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(6),
          );

    Widget defaultTile() {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Theme.of(context).backgroundColor),
        padding: const EdgeInsets.all(15.0),
        child: Row(
          /* Circular Progress */
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(right: 15),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 8,
                    value: progress,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).highlightColor),
                  ),
                  Center(
                    child: Text(
                      percent.format(progress),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            /* Title and Day */
            //Expanded(child: Text(title)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      day,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                openDialog();
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
            //Icon(Icons.arrow_forward_ios)
          ],
        ),
      );
    }

    Widget inputTile() {
      return GestureDetector(
        onTap: () {
          setState(() {
            showTextField = !showTextField;
          });
        },
        child: Container(
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Theme.of(context).backgroundColor,
            ),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    /* Title and Day */
                    //Expanded(child: Text(title)),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              day,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        openDialog();
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                    //Icon(Icons.arrow_forward_ios)
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 25.0,
                        width: 100.0,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).primaryColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: 120 * pi / 180,
                        child: const Icon(
                          Icons.horizontal_rule,
                          color: Color.fromRGBO(146, 95, 240, 1),
                          size: 30,
                        ),
                      ),
                      Text(
                        "$value$unit",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      );
    }

    /* Return */
    return GestureDetector(
      onTap: () {
        setState(() {
          showTextField = !showTextField;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTimeOfDay(habitTime),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Visibility(
              visible: showTextField,
              replacement: defaultTile(),
              child: inputTile(),
            ),
          ],
        ),
        // child: AnimatedSwitcher(
        //   duration: const Duration(seconds: 1),
        //   child: showTextField ? inputTile() : defaultTile(),
        // ),
      ),
    );
  }
}
