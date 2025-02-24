
import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator.dart';

void main(){
  test('should return 0 for an empty string', () {
    expect(StringCalculator.add(""), equals(0));
  });
}
