import 'dart:math';

import 'package:digital_clock/fibonacci_box.dart';
import 'package:digital_clock/fibonacci_grid.dart';
import 'package:digital_clock/fibonacci_map.dart';
import 'package:digital_clock/list_extensions.dart';
import 'package:flutter/material.dart';

class FibonacciClock extends StatelessWidget {
  const FibonacciClock({@required DateTime dateTime}) : _dateTime = dateTime;

  final DateTime _dateTime;
  static Random random = Random();

  @override
  Widget build(BuildContext context) {
    final fibonacciHour = _dateTime.hour % 12;
    final hourConfig = getFibonacciConfig(fibonacciHour);
    final fibonacciMinute = _dateTime.minute ~/ 5;
    final minuteConfig = getFibonacciConfig(fibonacciMinute) * 2;
    final config = hourConfig & minuteConfig;

    final List<FibonacciBox> boxes = [];
    for (var i = 0; i < config.length; i++) {
      boxes.add(FibonacciBox(
        color: getColor(config[i]),
        delay: i,
      ));
    }

    return Container(
      color: Colors.black,
      child: FibonacciGrid(
        children: boxes,
      ),
    );
  }

  List<int> getFibonacciConfig(int time) {
    final allMatched = fibonacciMap[time];
    final rng = random.nextInt(allMatched.length);
    return allMatched[rng];
  }

  Color getColor(int i) {
    switch (i) {
      case 0:
        return Colors.yellow;
        break;
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.green;
        break;
      case 3:
        return Colors.blue;
        break;
      default:
        return Colors.transparent;
    }
  }
}
