import 'package:flutter/material.dart';

class FibonacciBox extends StatelessWidget {
  FibonacciBox({Key key, @required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).unselectedWidgetColor,
        ),
        color: color,
      ),
    );
  }
}
