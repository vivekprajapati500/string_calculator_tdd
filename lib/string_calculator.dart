
class StringCalculator {
  static int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    if (numbers.startsWith("//")) {
      int newlineIndex = numbers.indexOf("\n");
      delimiter = numbers.substring(2, newlineIndex);
      numbers = numbers.substring(newlineIndex + 1);
    }

    numbers = numbers.replaceAll('\n', delimiter);

    List<String> numList = numbers.split(delimiter).where((s) => s.isNotEmpty).toList();

    List<int> intList = numList.map(int.parse).toList();

    List<int> negativeNumbers = intList.where((num) => num < 0).toList();

    if (negativeNumbers.isNotEmpty) {
      throw FormatException("negative numbers not allowed : ${negativeNumbers.join(', ')}");
    }

    return intList.reduce((a, b) => a + b);
  }
}
