import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

class TimeListener extends StatefulWidget {
  TimeListener({Key key, @required this.model, @required this.builder}) : super(key: key);

  final ClockModel model;
  final Widget Function(DateTime) builder;

  @override
  _TimeListenerState createState() => _TimeListenerState();
}

class _TimeListenerState extends State<TimeListener> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(TimeListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update each 5 minutes
      _timer = Timer(
        Duration(minutes: 5) -
            Duration(minutes: _dateTime.minute % 5) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_dateTime);
  }
}
