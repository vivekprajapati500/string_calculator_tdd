
class StringCalculator {
  static int add(String numbers) {
    if (numbers.isEmpty) return 0;

    numbers = numbers.replaceAll('\n', ',');

    List<String> numList = numbers.split(',');

    return numList.map(int.parse).reduce((a, b) => a + b);
  }
}
