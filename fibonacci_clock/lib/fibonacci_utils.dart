import 'dart:math';

import 'package:flutter/material.dart';

class FibonacciUtils {
  static Color getColor({@required double animationValue, @required Color oldColor, @required Color currentColor}) {
    if ((animationValue - pi / 2) % (2 * pi) > pi) {
      return oldColor;
    } else {
      return currentColor;
    }
  }
}
