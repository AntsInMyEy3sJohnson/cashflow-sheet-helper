import 'package:cashflow_sheet_helper/helpers/input_validation/generic_input_validation.dart';

class BuyDoodadInputValidation {

  BuyDoodadInputValidation._();

  static String? validateAmount(String? value) {
    return GenericInputValidation.integerValidation(value);
  }

}