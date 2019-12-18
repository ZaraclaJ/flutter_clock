import 'dart:math';

import 'package:flutter/material.dart';

class FibonacciBox extends StatefulWidget {
  FibonacciBox({
    Key key,
    @required this.color,
    @required this.delay,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final Color color;
  final int delay;
  final Duration duration;

  @override
  _FibonacciBoxState createState() => _FibonacciBoxState();
}

class _FibonacciBoxState extends State<FibonacciBox> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Color currentColor;
  Color oldColor;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween<double>(begin: 0, end: pi).animate(controller);
  }

  @override
  void didUpdateWidget(FibonacciBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    oldColor = oldWidget.color;
    currentColor = widget.color;

    Future.delayed(widget.duration * widget.delay, () {
      controller.forward().then((_) {
        controller.reset();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Theme.of(context).unselectedWidgetColor,
          ),
          color: widget.color,
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()..rotateX(animation.value),
          child: child,
        );
      },
    );
  }
}
