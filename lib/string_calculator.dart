
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
    return numList.map(int.parse).reduce((a, b) => a + b);
  }
}
