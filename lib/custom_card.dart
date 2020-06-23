import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.color, this.child, this.border});

  final Color color;
  final Widget child;
  final Border border;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        border: border,
      ),
      margin: EdgeInsets.all(10.0),
    );
  }
}
