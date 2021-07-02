import 'package:cashflow_sheet_helper/widgets/buttons/colored_elevated_button.dart';
import 'package:cashflow_sheet_helper/widgets/buttons/style_kind.dart';
import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/helpers/dimension_helper.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/adjustable_padding.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/padding_kind.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final String textLeft;
  final String textRight;

  final StyleKind styleKindLeft;
  final StyleKind styleKindRight;

  final Function callbackLeft;
  final Function callbackRight;

  const ButtonRow(this.textLeft, this.textRight, this.styleKindLeft,
      this.styleKindRight, this.callbackLeft, this.callbackRight);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: AdjustablePadding(
            paddingKind: PaddingKind.large,
            child: ColoredElevatedButton(
              textLeft,
              TextSizeConstants.BUTTON_MEDIUM,
              callbackLeft,
              styleKindLeft,
              EdgeInsets.symmetric(
                vertical: DimensionHelper.veryLargeVerticalPadding(context),
              ),
            ),
          ),
        ),
        Expanded(
          child: AdjustablePadding(
            paddingKind: PaddingKind.large,
            child: ColoredElevatedButton(
              textRight,
              TextSizeConstants.BUTTON_MEDIUM,
              callbackRight,
              styleKindRight,
              EdgeInsets.symmetric(
                vertical: DimensionHelper.veryLargeVerticalPadding(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
