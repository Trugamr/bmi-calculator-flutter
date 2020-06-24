import 'package:flutter/material.dart';
import '../constants.dart';
import 'round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterCard extends StatelessWidget {
  CounterCard(
      {this.val, this.onSubtract, this.onAdd, this.title, this.subtitle});

  final int val;
  final String title, subtitle;
  final Function onAdd, onSubtract;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: kLabelTextStyle,
        ),
        // Number row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            // push text towards right a little, make it centered
            SizedBox(
              width: 22.0,
            ),
            Text(
              val.toString(),
              style: kNumberTextStyle,
            ),
            SizedBox(
              width: 2.0,
            ),
            Text(
              subtitle,
              style: kLabelTextStyle,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onSubtract,
            ),
            SizedBox(
              width: 12.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onAdd,
            ),
          ],
        ),
      ],
    );
  }
}
