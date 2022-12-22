// edit_dialog
import 'package:flutter/material.dart';

class EditDialog extends StatefulWidget {
  final String title;
  final int value;
  final String unit;

  // final String title, descriptions, text;
  // final Image img;

  const EditDialog({
    super.key,
    required this.title,
    required this.unit,
    required this.value,
  });

  @override
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  textBox(context, width, right) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, right, 5),
      height: 25.0,
      width: width,
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).primaryColor.withOpacity(0.7),
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
      width: 200,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Theme.of(context).backgroundColor,
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
          TextField(
            decoration: InputDecoration(
              hintText: "해빗 네임",
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "실천 요일 *",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text("m t w t"),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "해빗 상세정보 *",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                textBox(context, 170.0, 0.0),
                Row(
                  children: [
                    textBox(context, 60.0, 10.0),
                    textBox(context, 60.0, 0.0),
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
                    textBox(context, 100.0, 0.0),
                    Text(
                      "~",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    textBox(context, 100.0, 0.0),
                  ],
                ),
                textBox(context, 140.0, 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
