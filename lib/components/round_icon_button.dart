import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
      ),
      shape: CircleBorder(),
      onPressed: onPressed,
      elevation: 4.0,
      padding: EdgeInsets.all(0.0),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 52.0,
        height: 52.0,
      ),
    );
  }
}
