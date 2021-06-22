import 'package:cashflow_sheet_helper/helpers/input_validation/generic_input_validation.dart';

class SellSharesInputValidation {

  SellSharesInputValidation._();

  static String? validatePrice(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

  static String? validateNumShares(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

}