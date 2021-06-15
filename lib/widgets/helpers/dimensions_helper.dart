import 'package:cashflow_sheet_helper/widgets/constants/dimension_constants.dart';
import 'package:flutter/material.dart';

class DimensionsHelper {
  DimensionsHelper._();

  static double verticalPadding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width / DimensionConstants.VERTICAL_PADDING_DIVISOR;
  }

  static double horizontalPadding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.height / DimensionConstants.HORIZONTAL_PADDING_DIVISOR;
  }
}
