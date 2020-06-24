import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.text, this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: kAccentColor,
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0, letterSpacing: 1.4),
      ),
    );
  }
}
