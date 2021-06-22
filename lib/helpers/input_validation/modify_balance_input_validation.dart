import 'package:cashflow_sheet_helper/helpers/input_validation/generic_input_validation.dart';

class ModifyBalanceInputValidation {

  ModifyBalanceInputValidation._();

  static String? validateAmount(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

}