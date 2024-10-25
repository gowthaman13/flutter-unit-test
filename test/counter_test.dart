import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/counter.dart';

void main() {
  late Counter counter;

  setUp(() {
    counter = Counter();
  });

  //setUp -> test -> setUp -> test
  //setUpAll -> test -> test
  //given when then

  group('Counter class ->', () {
    test('given counter class when instantion then value of count should be 0',
        () {
      //Arrange

      //Act
      counter.incrementCounter();
      final val = counter.counter;

      //assert
      expect(val, 1);
    });

    test(
        'given counter class when is decrement then value of count should be -1',
        () {
      //Arrange

      //Act
      counter.decrementCounter();
      final val = counter.counter;

      //assert
      expect(val, -1);
    });
  });

  // group('counter class - ', () {
  //   final Counter counter = Counter();
  //   test('given counter class when instantion then value of count should be 0',
  //       () {
  //     //Act
  //     counter.incrementCounter();
  //     final val = counter.counter;

  //     //assert
  //     expect(val, 1);
  //   });

  //   test(
  //       'given counter class when is decrement then value of count should be -1',
  //       () {
  //     //Act
  //     counter.decrementCounter();
  //     final val = counter.counter;

  //     //assert
  //     expect(val, 0);
  //   });
  // });
}
