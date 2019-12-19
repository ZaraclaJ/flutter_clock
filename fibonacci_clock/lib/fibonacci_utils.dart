import 'dart:math';

import 'package:flutter/material.dart';

enum FibonacciColor {
  yellow,
  red,
  green,
  blue,
}

class FibonacciUtils {
  static FibonacciColor getColor({@required double animationValue, @required FibonacciColor oldColor, @required FibonacciColor currentColor}) {
    if ((animationValue - pi / 2) % (2 * pi) > pi) {
      return oldColor;
    } else {
      return currentColor;
    }
  }

  static FibonacciColor getFibonacciColor(int i) {
    switch (i) {
      case 1:
        return FibonacciColor.red;
      case 2:
        return FibonacciColor.green;
      case 3:
        return FibonacciColor.blue;
      case 0:
      default:
        return FibonacciColor.yellow;
    }
  }

  static Color getColorFromFibonacciColor(FibonacciColor fibonacciColor) {
    switch (fibonacciColor) {
      case FibonacciColor.red:
        return Color(0xFFe04852);
      case FibonacciColor.green:
        return Color(0xFF44d44b);
      case FibonacciColor.blue:
        return Color(0xFF686fec);
      case FibonacciColor.yellow:
      default:
        return Color(0xFFf0f046);
    }
  }
}
