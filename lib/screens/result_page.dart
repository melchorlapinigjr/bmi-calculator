import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/buttom_botton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultBmi extends StatelessWidget {
  ResultBmi(
      {@required this.bmiResult,
      @required this.bmiResultText,
      @required this.bmiResultInterpretation});

  final String bmiResult;
  final String bmiResultText;
  final String bmiResultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kNumberTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResultText,
                    style: kResultTextStyle,
                  ),
                  Text(bmiResult, style: kBMIResultTextStyle),
                  Text(bmiResultInterpretation,
                      textAlign: TextAlign.center, style: kLabelStyle),
                ],
              ),
            ),
          ),
          ButtomButton(
            buttonTitle: 'CLOSE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
