import 'package:cashflow_sheet_helper/widgets/helpers/dimension_helper.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/padding_kind.dart';
import 'package:flutter/material.dart';

class AdjustablePadding extends StatelessWidget {
  final Widget child;
  final PaddingKind paddingKind;

  const AdjustablePadding({required this.child, required this.paddingKind});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _insetsFromPaddingKind(context),
      child: child,
    );
  }

  EdgeInsets _insetsFromPaddingKind(BuildContext context) {
    switch (paddingKind) {
      case PaddingKind.large:
        return EdgeInsets.symmetric(
          vertical: DimensionHelper.largeVerticalPadding(context),
          horizontal: DimensionHelper.largeHorizontalPadding(context),
        );
      case PaddingKind.medium:
        return EdgeInsets.symmetric(
          vertical: DimensionHelper.mediumVerticalPadding(context),
          horizontal: DimensionHelper.mediumHorizontalPadding(context),
        );
      default:
        return EdgeInsets.symmetric(
          vertical: DimensionHelper.smallVerticalPadding(context),
          horizontal: DimensionHelper.smallHorizontalPadding(context),
        );
    }
  }
}
