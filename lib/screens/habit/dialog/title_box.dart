import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget {
  const TitleBox({Key? key, required this.inputTitle}) : super(key: key);

  final String inputTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(color: Color.fromARGB(255, 166, 180, 255)),
      margin: const EdgeInsets.only(top: 20, right: 25),
      child: Container(
        //color: Colors.white54,
        height: 35,
        //padding: const EdgeInsets.only(right: 40),
        child: TextField(
          style: Theme.of(context).textTheme.bodyText2,
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
                color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
