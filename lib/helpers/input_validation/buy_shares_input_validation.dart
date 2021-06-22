import 'package:cashflow_sheet_helper/helpers/input_validation/generic_input_validation.dart';

class BuySharesInputValidation {

  BuySharesInputValidation._();

  static String? validateName(String? value) {
    return GenericInputValidation.stringValidation(value);
  }

  static String? validatePrice(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

  static String? validateNumShares(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

}