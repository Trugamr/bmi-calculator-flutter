import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_card.dart';
import '../components/icon_content.dart';
import '../components/counter_card.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../calculator.dart';
import './result_page.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;
  int height = 160;
  int weight = 72;
  int age = 18;

  void updateWeight(int weight) {
    setState(() {
      this.weight = weight;
    });
  }

  void updateAge(int age) {
    setState(() {
      this.age = age;
    });
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          // Male
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => selectedGender = Gender.MALE),
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
                            onTap: () =>
                                setState(() => selectedGender = Gender.FEMALE),
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
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25.0),
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
                            child: CounterCard(
                              title: 'WEIGHT',
                              subtitle: 'kg',
                              val: weight,
                              onAdd: () => updateWeight(weight + 1),
                              onSubtract: () => updateWeight(weight - 1),
                            ),
                            color: kLightPrimary,
                          ),
                        ),
                        Expanded(
                          child: CustomCard(
                            child: CounterCard(
                              title: 'AGE',
                              subtitle: 'yrs',
                              val: age,
                              onAdd: () => updateAge(age + 1),
                              onSubtract: () => updateAge(age - 1),
                            ),
                            color: kLightPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            height: 66.0,
            width: double.infinity,
            child: BottomButton(
              text: 'CALCULATE',
              onPressed: () {
                Calculator bmiCalc = Calculator(
                  height: height,
                  weight: weight,
                );

                Map<String, String> result = {
                  'bmiResult': bmiCalc.calculateBMI(),
                  'resultText': bmiCalc.getResult(),
                  'interpretation': bmiCalc.getInterpretation()
                };

                print(result.toString());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                        bmiResult: bmiCalc.calculateBMI(),
                        resultText: bmiCalc.getResult(),
                        interpretation: bmiCalc.getInterpretation()),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
