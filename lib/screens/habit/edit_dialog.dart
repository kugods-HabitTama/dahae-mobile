// edit_dialog
import 'package:flutter/material.dart';

class EditDialog extends StatefulWidget {
  // final String title, descriptions, text;
  // final Image img;

  const EditDialog({
    super.key,
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

  contentBox(context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border:
            Border.all(width: 2, color: Theme.of(context).bottomAppBarColor),
        color: Theme.of(context).backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          const Text("Day"),
          const Text("Info"),
        ],
      ),
    );
  }
}
