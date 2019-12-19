import 'dart:math';

import 'package:digital_clock/fibonacci_utils.dart';
import 'package:flutter/material.dart';

class FibonacciBox extends StatefulWidget {
  FibonacciBox({
    Key key,
    @required this.color,
    @required this.delay,
    @required this.orientation,
    this.duration = const Duration(seconds: 1),
    this.finalAngle = pi,
  }) : super(key: key);

  final FibonacciColor color;
  final int delay;
  final Duration duration;
  final double finalAngle;
  final int orientation;

  @override
  _FibonacciBoxState createState() => _FibonacciBoxState();
}

class _FibonacciBoxState extends State<FibonacciBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  FibonacciColor _currentColor;
  FibonacciColor _oldColor;
  bool _rotationX;

  @override
  void initState() {
    super.initState();
    // Set the rotation direction
    final rotationDirection = (widget.orientation == 1 || widget.orientation == 2) ? 1 : -1;
    _rotationX = (widget.orientation == 0 || widget.orientation == 2);

    _oldColor = widget.color;
    _controller = AnimationController(duration: widget.duration, vsync: this);
    final Animation curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation = Tween<double>(begin: 0, end: rotationDirection * widget.finalAngle).animate(curve);
  }

  @override
  void didUpdateWidget(FibonacciBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    _oldColor = oldWidget.color;
    _currentColor = widget.color;
    _controller.reset();
    Future.delayed(widget.duration * (widget.delay / 5), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget child) {
        final matrix = Matrix4.identity()..setEntry(3, 2, 0.002);
        if (_rotationX) {
          matrix.rotateX(_animation.value);
        } else {
          matrix.rotateY(_animation.value);
        }

        return Transform(
          alignment: FractionalOffset.center,
          transform: matrix,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Theme.of(context).unselectedWidgetColor,
              ),
              color: FibonacciUtils.getColorFromFibonacciColor(
                FibonacciUtils.getColor(
                  animationValue: _animation.value,
                  currentColor: _currentColor,
                  oldColor: _oldColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
