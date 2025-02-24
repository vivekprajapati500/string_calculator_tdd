
import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator.dart';

void main(){
  group('String Calculator', () {
    test('should return 0 for an empty string', () {
      expect(StringCalculator.add(""), equals(0));
    });

    test('should return the number itself if only one number is provided', () {
      expect(StringCalculator.add("1"), equals(1));
    });

    test('should return the sum of two numbers', () {
      expect(StringCalculator.add("1,5"), equals(6));
    });

    test('should handle an unknown amount of numbers', () {
      expect(StringCalculator.add("1,2,3,4,5"), equals(15));
    });

    test('should handle new lines between numbers', () {
      expect(StringCalculator.add("1\n2,3"), equals(6));
      expect(StringCalculator.add("4\n5\n6"), equals(15));
      expect(StringCalculator.add("7,8\n9,10"), equals(34));
    });

    test('should support different delimiters', () {
      expect(StringCalculator.add("//;\n1;2"), equals(3));
    });

  });
}
