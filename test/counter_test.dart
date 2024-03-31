import 'package:flutter_test/flutter_test.dart';
import 'package:rmo_food/counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.decrement();

    expect(counter.value, -1);
  });
}
