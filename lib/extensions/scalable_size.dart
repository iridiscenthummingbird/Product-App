import 'package:flutter/material.dart';

/*
 *  To get the scalable size, from number passed as a parameter in functions
 *  getScalableHeight(int) and getScalableWigth(int), 
 *  on the device srceen, you need to know in how many 
 *  times this number different from size (height or wight) of screen in design. 
 * 
 *  812px - height of the screen in design
 *  100px - given number in design
 * 
 *  812px / 100px = 8.12
 * 
 *  8.12 -  coefficient of proportionality, it means in how many times given 
 *  number in design smaller then height of the screen in design.
 * 
 *  And then, if you take height of the screen on device with MediaQuery and divide it on this 
 *  coefficient, you will get the number in required number of times
 *  different from the size in the design.
 */

extension ScalableSize on BuildContext {
  static double designHeight = 844;
  static double designWigth = 390;

  double getScalableHeight(double givenHeight) =>
      MediaQuery.of(this).size.height /
      _getProportionalCoefficient(designHeight, givenHeight);

  double getScalableWidth(double givenWidth) =>
      MediaQuery.of(this).size.width /
      _getProportionalCoefficient(designWigth, givenWidth);

  double _getProportionalCoefficient(double a, double b) => a / b;
}
