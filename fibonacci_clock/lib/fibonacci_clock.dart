import 'dart:math';

import 'package:digital_clock/fibonacci_box.dart';
import 'package:digital_clock/fibonacci_grid.dart';
import 'package:digital_clock/fibonacci_map.dart';
import 'package:digital_clock/fibonacci_utils.dart';
import 'package:digital_clock/list_extensions.dart';
import 'package:flutter/material.dart';

class FibonacciClock extends StatefulWidget {
  const FibonacciClock({@required DateTime dateTime}) : _dateTime = dateTime;

  final DateTime _dateTime;
  static Random random = Random();

  @override
  _FibonacciClockState createState() => _FibonacciClockState();
}

class _FibonacciClockState extends State<FibonacciClock> {
  List<FibonacciBox> _boxes = [];

  @override
  void initState() {
    super.initState();
    _updateBoxes();
  }

  @override
  void didUpdateWidget(FibonacciClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._dateTime != widget._dateTime) {
      _updateBoxes();
    }
  }

  void _updateBoxes() {
    final fibonacciHour = widget._dateTime.hour % 12;
    final hourConfig = _getFibonacciConfig(fibonacciHour);
    final fibonacciMinute = widget._dateTime.minute ~/ 5;
    final minuteConfig = _getFibonacciConfig(fibonacciMinute) * 2;
    final config = hourConfig & minuteConfig;

    _boxes.clear();
    for (var i = 0; i < config.length; i++) {
      _boxes.add(FibonacciBox(
        color: FibonacciUtils.getFibonacciColor(config[i]),
        delay: i,
        orientation: i % 4,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FibonacciGrid(
        children: _boxes,
      ),
    );
  }

  List<int> _getFibonacciConfig(int time) {
    final allMatched = fibonacciMap[time];
    final rng = FibonacciClock.random.nextInt(allMatched.length);
    return allMatched[rng];
  }
}
