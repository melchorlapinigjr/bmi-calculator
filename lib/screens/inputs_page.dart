import 'package:bmi_calculator/components/buttom_botton.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_botton.dart';
import 'package:bmi_calculator/constants.dart'; 
import 'package:bmi_calculator/screens/icon_content.dart';
import 'package:bmi_calculator/screens/result_page.dart'; 
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 
import 'package:bmi_calculator/calculator_brain.dart';

class BmiHome extends StatefulWidget {
  @override
  _BmiHomeState createState() => _BmiHomeState();
}

enum Gender {
  male,
  female,
}

class _BmiHomeState extends State<BmiHome> {
  Gender selectedGender;
  int _height = 180;
  int _weight = 60;
  int _age = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveColor,
                    cardChild: IconContent(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFFEB15555),
                      activeTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB15555),
                      thumbColor: kBottomContainerColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 18.0,
                      ),
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(_weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButtonCircle(
                              icon: FontAwesomeIcons.minus,
                              onPressWeight: () {
                                setState(() {
                                  _weight.toInt() != 0
                                      ? _weight--
                                      : _weight = 0;
                                });
                              },
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            RoundButtonCircle(
                              icon: FontAwesomeIcons.plus,
                              onPressWeight: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelStyle),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(_age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButtonCircle(
                                icon: FontAwesomeIcons.minus,
                                onPressWeight: () {
                                  setState(() {
                                    _age--;
                                  });
                                }),
                            SizedBox(
                              width: 2.0,
                            ),
                            RoundButtonCircle(
                                icon: FontAwesomeIcons.plus,
                                onPressWeight: () {
                                  setState(() {
                                    _age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              setState(() {
                CalculateBMI calculate = CalculateBMI(_height, _weight);   
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultBmi(
                      bmiResult: calculate.calculateBMI(),
                      bmiResultInterpretation: calculate.getInterpretation(),
                      bmiResultText: calculate.getResult()
                    )));
              });
            },
          )
        ],
      ),
    );
  }
}




