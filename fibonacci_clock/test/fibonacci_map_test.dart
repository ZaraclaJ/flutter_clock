// Import the test package and Counter class
import 'package:digital_clock/fibonacci_map.dart';
import 'package:test/test.dart';

void main() {
  const List<int> fibonacciList = [1, 1, 2, 3, 5];

  test('Fibonacci map is valid', () {
    int calcul(List<int> config) {
      var sum = 0;
      for (var i = 0; i < config.length; i++) {
        sum += config[i] * fibonacciList[i];
      }
      return sum;
    }

    final map = fibonacciMap;

    map.forEach((int key, List<List<int>> configList) {
      configList.forEach((config) {
        expect(config.length, 5);
        final sum = calcul(config);
        expect(sum, key);
      });
    });
  });
}
