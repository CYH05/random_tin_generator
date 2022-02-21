class Tin {
  late final String tin;

  List<String> _clearTin(String code) {
    var plainTin = code.replaceAll('.', '');
    plainTin = plainTin.replaceAll('-', '');
    var number = plainTin.split("");
    return number;
  }

  bool _validateDigit(int count, List generatedTin) {
    int indexHelper = 0;
    int result = 0;
    int digitValidator;
    for (count; count >= 2; count--) {
      result += int.parse(generatedTin[indexHelper]) * count;
      indexHelper++;
    }
    if (result % 11 < 2) {
      digitValidator = 0;
    } else {
      digitValidator = 11 - (result % 11);
    }
    if (digitValidator == int.parse(generatedTin[indexHelper])) {
      return true;
    } else {
      return false;
    }
  }

  _formatTin(List<String> plainTin) {
    String formatedTin = "";

    for (var index = 0; index < plainTin.length; index++) {
      if (index == 3 || index == 6) {
        formatedTin += ".";
      }
      if (index == 9) {
        formatedTin += "-";
      }
      formatedTin += plainTin[index];
    }
    return formatedTin;
  }

  validateTin(String code) {
    var plainTin = _clearTin(code);
    if (_validateDigit(10, plainTin) && _validateDigit(11, plainTin)) {
      tin = _formatTin(plainTin);
      return true;
    }
    return false;
  }
}
