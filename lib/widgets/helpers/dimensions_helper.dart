import 'package:cashflow_sheet_helper/widgets/constants/dimension_constants.dart';
import 'package:flutter/material.dart';

class DimensionsHelper {
  DimensionsHelper._();

  static double largeVerticalPadding(BuildContext context) {
    return _width(context) / DimensionConstants.VERTICAL_PADDING_DIVISOR_LARGE;
  }

  static double largeHorizontalPadding(BuildContext context) {
    return _height(context) / DimensionConstants.HORIZONTAL_PADDING_DIVISOR_LARGE;
  }

  static double mediumVerticalPadding(BuildContext context) {
    return _width(context) / DimensionConstants.VERTICAL_PADDING_DIVISOR_MEDIUM;
  }

  static double mediumHorizontalPadding(BuildContext context) {
    return _height(context) / DimensionConstants.HORIZONTAL_PADDING_DIVISOR_MEDIUM;
  }

  static double smallVerticalPadding(BuildContext context) {
    return _width(context) / DimensionConstants.VERTICAL_PADDING_DIVISOR_SMALL;
  }

  static double smallHorizontalPadding(BuildContext context) {
    return _height(context) / DimensionConstants.HORIZONTAL_PADDING_DIVISOR_SMALL;
  }

  static double _width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double _height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

}
