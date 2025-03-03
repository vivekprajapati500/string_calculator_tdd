
class StringCalculator {
  static int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    List<String> delimiters = [','];

    if (numbers.startsWith("//")) {
      int newlineIndex = numbers.indexOf("\n");

      if (numbers.contains("[") && numbers.contains("]")) {
        delimiters = RegExp(r"\[(.*?)\]")
            .allMatches(numbers.substring(2, newlineIndex))
            .map((m) => m.group(1)!)
            .toList();
      } else {
        delimiter = numbers.substring(2, newlineIndex);
      }

      numbers = numbers.substring(newlineIndex + 1);
    }

    numbers = numbers.replaceAll('\n', ',');

    String delimiterPattern = delimiters.map(RegExp.escape).join('|');
    numbers = numbers.replaceAll('\n', delimiter);
    List<String> numList = numbers.split(RegExp(delimiterPattern)).where((s) => s.isNotEmpty).toList();

    List<int> intList = numList.map(int.parse).toList();

    List<int> negativeNumbers = intList.where((num) => num < 0).toList();

    if (negativeNumbers.isNotEmpty) {
      throw FormatException("negative numbers not allowed: ${negativeNumbers.join(', ')}");
    }

    return intList.where((num) => num <= 1000).reduce((a, b) => a + b);
  }
}
