import 'dart:math';

import 'package:digital_clock/fibonacci_utils.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  final currentColor = Colors.black;
  final oldColor = Colors.white;

  group('Get color during rotation', () {
    test('animation value = 0', () {
      final result = FibonacciUtils.getColor(animationValue: 0, oldColor: oldColor, currentColor: currentColor);
      expect(result, oldColor);
    });

    test('animation value = pi', () {
      final result = FibonacciUtils.getColor(animationValue: pi, oldColor: oldColor, currentColor: currentColor);
      expect(result, currentColor);
    });

    test('animation value = 2*pi', () {
      final result = FibonacciUtils.getColor(animationValue: 2 * pi, oldColor: oldColor, currentColor: currentColor);
      expect(result, oldColor);
    });

    test('animation value = 3*pi', () {
      final result = FibonacciUtils.getColor(animationValue: 3 * pi, oldColor: oldColor, currentColor: currentColor);
      expect(result, currentColor);
    });

    test('animation value = pi/2-', () {
      final result = FibonacciUtils.getColor(animationValue: pi / 2 - 0.01, oldColor: oldColor, currentColor: currentColor);
      expect(result, oldColor);
    });

    test('animation value = pi/2+', () {
      final result = FibonacciUtils.getColor(animationValue: pi / 2 + 0.01, oldColor: oldColor, currentColor: currentColor);
      expect(result, currentColor);
    });

    test('animation value = -pi/2+', () {
      final result = FibonacciUtils.getColor(animationValue: -pi / 2 + 0.01, oldColor: oldColor, currentColor: currentColor);
      expect(result, oldColor);
    });

    test('animation value = -pi/2-', () {
      final result = FibonacciUtils.getColor(animationValue: -pi / 2 - 0.01, oldColor: oldColor, currentColor: currentColor);
      expect(result, currentColor);
    });

    test('animation value = 3/2*pi-', () {
      final result = FibonacciUtils.getColor(animationValue: 3 / 2 * pi - 0.01, oldColor: oldColor, currentColor: currentColor);
      expect(result, currentColor);
    });

    test('animation value = 3/2*pi+', () {
      final result = FibonacciUtils.getColor(animationValue: 3 / 2 * pi + 0.01, oldColor: oldColor, currentColor: currentColor);
      expect(result, oldColor);
    });

    test('animation value = 3/2*pi-', () {
      final result = FibonacciUtils.getColor(animationValue: -3 / 2 * pi - 0.01, oldColor: oldColor, currentColor: currentColor);
      expect(result, oldColor);
    });

    test('animation value = 3/2*pi+', () {
      final result = FibonacciUtils.getColor(animationValue: -3 / 2 * pi + 0.01, oldColor: oldColor, currentColor: currentColor);
      expect(result, currentColor);
    });
  });
}
