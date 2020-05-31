import 'dart:math';
class CalculateBMI {
  CalculateBMI(this.height, this.weight);
  final int height;
  final int weight; 
 double _bmi;
  String calculateBMI() {
    _bmi= weight/ pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >=25)
    return 'Overweight';
    else if (_bmi > 18.5) 
    return 'Normal';
    else
    return 'Underweight';
  }

String getInterpretation() {
   if (_bmi >=25)
    return 'You need more exercise everyday and eat less. :)';
    else if (_bmi > 18.5) 
    return 'You are normal. Please keep your body routines.';
    else
    return 'You need more nutrition, please some more fruits and vegetables.';
}
}