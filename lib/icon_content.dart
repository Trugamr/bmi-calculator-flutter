import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.text, this.icon, this.enabled});

  final String text;
  final IconData icon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: enabled ? Colors.white : Color(0xff8d8e98),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelTextStyle.copyWith(
            color: enabled ? Colors.white : Color(0xff8d8e98),
          ),
        )
      ],
    );
  }
}
