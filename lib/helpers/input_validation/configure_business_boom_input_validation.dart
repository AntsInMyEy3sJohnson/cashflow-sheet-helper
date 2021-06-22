import 'package:cashflow_sheet_helper/helpers/input_validation/generic_input_validation.dart';

class ConfigureBusinessBoomInputValidation {

  ConfigureBusinessBoomInputValidation._();

  static String? validateThreshold(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

  static String? validateCashflowIncrease(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

}