import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox(
      {Key? key,
      required this.width,
      required this.rightOffset,
      required this.hintText})
      : super(key: key);

  final double width;
  final double rightOffset;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, rightOffset, 5),
      height: 30.0,
      width: width,
      alignment: Alignment.centerLeft,
      child: TextField(
        style: Theme.of(context).textTheme.bodyText2,
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
}
