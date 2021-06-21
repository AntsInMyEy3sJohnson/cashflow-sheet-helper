import 'package:cashflow_sheet_helper/helpers/input_validation/generic_input_validation.dart';

class BuyHoldingInputValidation {

  BuyHoldingInputValidation._();

  static String? validateName(String? value) {
    return GenericInputValidation.stringValidation(value);
  }

  static String? validateNumUnits(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

  static String? validateDownPayment(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

  static String? validateBuyingCost(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

  static String? validateMortgage(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

  static String? validateMonthlyCashflow(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

}