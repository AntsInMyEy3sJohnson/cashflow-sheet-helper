import 'package:cashflow_sheet_helper/widgets/helpers/dimensions_helper.dart';
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
          vertical: DimensionsHelper.largeVerticalPadding(context),
          horizontal: DimensionsHelper.largeHorizontalPadding(context),
        );
      case PaddingKind.medium:
        return EdgeInsets.symmetric(
          vertical: DimensionsHelper.mediumVerticalPadding(context),
          horizontal: DimensionsHelper.mediumHorizontalPadding(context),
        );
      default:
        return EdgeInsets.symmetric(
          vertical: DimensionsHelper.smallVerticalPadding(context),
          horizontal: DimensionsHelper.smallHorizontalPadding(context),
        );
    }
  }
}
