import 'package:flutter/material.dart';

class FibonacciGrid extends StatelessWidget {
  const FibonacciGrid({Key key, @required List<Widget> children, this.orientation = 0})
      : _children = children,
        super(key: key);

  final List<Widget> _children;
  final int orientation;

  @override
  Widget build(BuildContext context) {
    if (_children.isEmpty) {
      return SizedBox();
    } else if (_children.length == 1) {
      return _children.first;
    } else {
      final childBox = Expanded(child: _children.last);
      final childrenBox = Expanded(
        child: FibonacciGrid(
          orientation: orientation + 1 % 4,
          children: _children.sublist(0, _children.length - 1),
        ),
      );

      final childFirst = [
        childBox,
        childrenBox,
      ];

      final childrenFirst = [
        childrenBox,
        childBox,
      ];

      if (orientation == 0 || orientation == 2) {
        return Row(
          children: <Widget>[
            ...orientation == 0 ? childrenFirst : childFirst,
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            ...orientation == 1 ? childrenFirst : childFirst,
          ],
        );
      }
    }
  }
}
