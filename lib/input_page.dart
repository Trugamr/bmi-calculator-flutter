import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_card.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatelessWidget {
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
                color: kAccentColor,
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

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  Gender selectedGender = Gender.MALE;
  int height = 160;
  int weight = 72;

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
                child: GestureDetector(
                  onTap: () => setState(() => selectedGender = Gender.MALE),
                  child: CustomCard(
                    color: selectedGender == Gender.MALE
                        ? kLightPrimary
                        : kDarkPrimary,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                      enabled: selectedGender == Gender.MALE,
                    ),
                  ),
                ),
              ),
              Expanded(
                // Female
                child: GestureDetector(
                  onTap: () => setState(() => selectedGender = Gender.FEMALE),
                  child: CustomCard(
                    color: selectedGender == Gender.FEMALE
                        ? kLightPrimary
                        : kDarkPrimary,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                      enabled: selectedGender == Gender.FEMALE,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          // Slider
          child: CustomCard(
            color: kLightPrimary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xff8d8e98),
                    thumbColor: Color(0xffeb1555),
                    overlayColor: Color(0x29eb1555),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Slider(
                      onChanged: (double val) =>
                          setState(() => height = val.toInt()),
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: CustomCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
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
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            'kg',
                            style: kLabelTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                  color: kLightPrimary,
                ),
              ),
              Expanded(
                child: CustomCard(
                  color: kLightPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
