
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
      expect(StringCalculator.add("//|\n4|5|6"), equals(15));
      expect(StringCalculator.add("//-\n10-20-30"), equals(60));
      expect(StringCalculator.add("//#\n7#8#9"), equals(24));
    });

    test('should throw an exception for negative numbers', () {
      expect(() => StringCalculator.add("-1,2,3"), throwsA(isA<FormatException>()));

      expect(
            () => StringCalculator.add("1,-2,3,-4"),
        throwsA(
          isA<FormatException>().having(
                (e) => e.message,
            'message',
            "negative numbers not allowed: -2, -4",
          ),
        ),
      );

      expect(
            () => StringCalculator.add("//;\n1;-2;3;-5"),
        throwsA(
          isA<FormatException>().having(
                (e) => e.message,
            'message',
            "negative numbers not allowed: -2, -5",
          ),
        ),
      );
    });

    test('should ignore numbers greater than 1000', () {
      expect(StringCalculator.add("2,1001"), equals(2));
      expect(StringCalculator.add("1000,999,1001"), equals(1999));
      expect(StringCalculator.add("//;\n500;1001;600"), equals(1100));
    });

    test('should support multi-character delimiters', () {
      expect(StringCalculator.add("//[***]\n1***2***3"), equals(6));
      expect(StringCalculator.add("//[--]\n7--8--9"), equals(24));
    });

    test('should support multiple delimiters', () {
      expect(StringCalculator.add("//[*][%]\n1*2%3"), equals(6));
      expect(StringCalculator.add("//[*][%][#]\n10*20%30#40"), equals(100));
    });
  });
}
