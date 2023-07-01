class ConvertNumber {
  static String convertNumber(int number) {
    if (number >= 1000000) {
      double convertedNumber = number / 1000000;
      return convertedNumber.toStringAsFixed(1) + 'm';
    } else if (number >= 1000) {
      double convertedNumber = number / 1000;
      return convertedNumber.toStringAsFixed(1) + 'k';
    } else {
      return number.toString();
    }
  }
}
