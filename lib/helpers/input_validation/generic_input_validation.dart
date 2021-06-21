class GenericInputValidation {

  GenericInputValidation._();

  static String? stringValidation(String? value) {
    if (_isNullOrEmpty(value)) {
      return "Must not be empty";
    }
    return null;
  }

  static String? integerValidation(String? value) {
    if(_isNullOrEmpty(value)) {
      return "Must not be empty";
    }
    if(int.tryParse(value!) == null) {
      return "Must be a valid integer";
    }
    if (int.parse(value) < 0) {
      return "Must not be less than zero";
    }
    return null;
  }

  static bool _isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

}