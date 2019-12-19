import 'dart:math';

import 'package:digital_clock/fibonacci_box.dart';
import 'package:digital_clock/fibonacci_grid.dart';
import 'package:digital_clock/fibonacci_map.dart';
import 'package:digital_clock/fibonacci_utils.dart';
import 'package:digital_clock/list_extensions.dart';
import 'package:flutter/material.dart';

class FibonacciClock extends StatelessWidget {
  const FibonacciClock({@required DateTime dateTime}) : _dateTime = dateTime;

  final DateTime _dateTime;
  static Random random = Random();

  @override
  Widget build(BuildContext context) {
    final fibonacciHour = _dateTime.hour % 12;
    final hourConfig = _getFibonacciConfig(fibonacciHour);
    final fibonacciMinute = _dateTime.minute ~/ 5;
    final minuteConfig = _getFibonacciConfig(fibonacciMinute) * 2;
    final config = hourConfig & minuteConfig;

    final List<FibonacciBox> boxes = [];
    for (var i = 0; i < config.length; i++) {
      boxes.add(FibonacciBox(
        color: FibonacciUtils.getFibonacciColor(config[i]),
        delay: i,
        orientation: i % 4,
      ));
    }

    return Container(
      color: Colors.black,
      child: FibonacciGrid(
        children: boxes,
      ),
    );
  }

  List<int> _getFibonacciConfig(int time) {
    final allMatched = fibonacciMap[time];
    final rng = random.nextInt(allMatched.length);
    return allMatched[rng];
  }
}
