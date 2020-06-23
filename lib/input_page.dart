import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_card.dart';
import 'icon_content.dart';

const Color lightPrimary = Color(0xfff1d1e33);
const Color accentColor = Color(0xffeb1555);

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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Cards(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            height: 66.0,
            width: double.infinity,
            child: Expanded(
              child: RaisedButton(
                onPressed: () => {},
                color: accentColor,
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 18.0, letterSpacing: 1.4),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                // Male
                child: CustomCard(
                  color: lightPrimary,
                  child: IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                ),
              ),
              Expanded(
                // Female
                child: CustomCard(
                    color: lightPrimary,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    )),
              ),
            ],
          ),
        ),
        Expanded(
          // Slider
          child: CustomCard(
            color: lightPrimary,
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: CustomCard(
                  color: lightPrimary,
                ),
              ),
              Expanded(
                child: CustomCard(
                  color: lightPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
