import 'package:cashflow_sheet_helper/helpers/input_validation/generic_input_validation.dart';

class SellHoldingInputValidation {

  SellHoldingInputValidation._();

  static String? validatePricePerUnit(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

  static String? validatePercentagePrice(String? value) {
    final String? genericValidation = GenericInputValidation.integerValidation(value);
    if(genericValidation != null) {
      return genericValidation;
    }
    if(int.parse(value!) > 100) {
      return "Must be a value between 0 and 100";
    }
    return null;
  }

  static String? validateAbsolutePrice(String? value) {
    return GenericInputValidation.integerValidation(value);
  }


}