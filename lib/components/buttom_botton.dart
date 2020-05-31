import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({@required this.buttonTitle, @required this.onTap});

  final String buttonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLabelStyle,
          ),
        ),
        padding: EdgeInsets.only(
          bottom: 5.0,
        ),
        color: kBottomContainerColor,
        height: 40.0,
        width: double.infinity,
      ),
      onTap: onTap,
    );
  }
}