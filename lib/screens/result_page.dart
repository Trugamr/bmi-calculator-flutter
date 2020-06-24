import 'package:flutter/material.dart';
import '../components/custom_card.dart';
import '../components/bottom_button.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });

  final String bmiResult, resultText, interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 10.0),
            child: Text(
              'Your Result',
              style: kNumberTextStyle.copyWith(fontSize: 34.0),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomCard(
                color: kLightPrimary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: kNumberTextStyle.copyWith(fontSize: 80.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        interpretation,
                        style: kLabelTextStyle.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            height: 66.0,
            width: double.infinity,
            child: BottomButton(
              text: 'RE-CALCULATE',
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
