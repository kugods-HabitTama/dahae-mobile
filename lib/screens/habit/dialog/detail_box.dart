import 'package:flutter/material.dart';
import './text_box.dart';

class detailBox extends StatelessWidget {
  const detailBox({
    Key? key,
    required this.action,
    required this.value,
    required this.unit,
  }) : super(key: key);

  final String action;
  final int value;
  final String unit;

  @override
  Widget build(BuildContext context) {
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
          TextBox(width: 200.0, rightOffset: 14.0, hintText: action),
          Row(
            children: [
              TextBox(
                  width: 80.0, rightOffset: 10.0, hintText: value.toString()),
              TextBox(width: 80.0, rightOffset: 0.0, hintText: unit),
            ],
          ),
        ],
      ),
    );
  }
}
