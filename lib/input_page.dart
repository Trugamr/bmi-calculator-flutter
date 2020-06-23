import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      color: Color(0xfff1d1e33),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: Color(0xfff1d1e33),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                color: Color(0xfff1d1e33),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      color: Color(0xfff1d1e33),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: Color(0xfff1d1e33),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({@required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }
}
