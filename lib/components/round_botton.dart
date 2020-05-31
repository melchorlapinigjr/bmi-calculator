import 'package:flutter/material.dart';

class RoundButtonCircle extends StatelessWidget {
  RoundButtonCircle({@required this.icon, this.onPressWeight});

  final Function onPressWeight;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressWeight,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
    );
  }
}