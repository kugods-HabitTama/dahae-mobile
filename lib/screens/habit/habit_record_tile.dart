import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:dahae_mobile/data/models/habit_record.dart';

class HabitRecordTile extends StatefulWidget {
  final HabitRecord habitRecord;

  const HabitRecordTile({super.key, required this.habitRecord});

  @override
  State<HabitRecordTile> createState() => _HabitRecordTileState();
}

class _HabitRecordTileState extends State<HabitRecordTile> {
  bool _open = false;
  bool _onProgress = false;

  final percent = NumberFormat("##%");

  // Future<String?> openDialog() => showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return EditDialog(
  //         title: widget.habitRecord.habit.title,
  //         unit: widget.habitRecord.habit.unit,
  //         value: widget.habitRecord.habit.value,
  //       );
  //     });

  @override
  Widget build(BuildContext context) {
    TextEditingController _progressController =
        TextEditingController(text: "${widget.habitRecord.progress}");

    var borderRadius = _open
        ? const BorderRadius.only(
            topLeft: Radius.circular(50),
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

    var arrowIcon = AnimatedRotation(
      turns: _open ? -0.25 : 0.25,
      duration: const Duration(milliseconds: 100),
      child: Icon(Icons.arrow_forward_ios,
          size: 26,
          color: _onProgress
              ? Theme.of(context).highlightColor
              : Theme.of(context).hintColor),
    );

    Widget defaultTile = Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          borderRadius: borderRadius, color: Theme.of(context).backgroundColor),
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
                  value: widget.habitRecord.progressPercent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).highlightColor),
                ),
                Center(
                  child: Text(
                    percent.format(widget.habitRecord.progressPercent),
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
                    widget.habitRecord.habit.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    widget.habitRecord.habit.daysToString,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),

          arrowIcon,
          // IconButton(
          //   onPressed: () {
          //     // openDialog();
          //   },
          //   icon: const Icon(Icons.arrow_forward_ios),
          // ),
        ],
      ),
    );

    Widget inputTile = Container(
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
                        widget.habitRecord.habit.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        widget.habitRecord.habit.daysToString,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              arrowIcon,
              // IconButton(
              //   onPressed: () {
              //     setState(() {
              //       _open = !_open;
              //     });
              //   },
              //   icon: const Icon(Icons.arrow_forward_ios),
              // ),
              //Icon(Icons.arrow_forward_ios)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                SizedBox(
                  height: 25.0,
                  width: 100.0,
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText2,
                    controller: _progressController,
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
                  "${widget.habitRecord.habit.value} ${widget.habitRecord.habit.unit}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    /* Return */
    return GestureDetector(
      onTap: () {
        setState(() {
          _open = !_open;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.habitRecord.habit.time.format(context),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            _open ? inputTile : defaultTile
          ],
        ),
        // child: AnimatedSwitcher(
        //   duration: const Duration(seconds: 1),
        //   child: _open ? inputTile() : defaultTile(),
        // ),
      ),
    );
  }
}
