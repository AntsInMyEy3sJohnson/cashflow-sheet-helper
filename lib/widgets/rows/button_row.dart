import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/helpers/dimension_helper.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/adjustable_padding.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/padding_kind.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final String textLeft;
  final String textRight;

  final Function? callbackLeft;
  final Function? callbackRight;

  const ButtonRow(
      this.textLeft, this.textRight, this.callbackLeft, this.callbackRight);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: AdjustablePadding(
            paddingKind: PaddingKind.large,
            child: ElevatedButton(
              onPressed: callbackLeft == null ? null : () => callbackLeft!(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical:
                        DimensionHelper.veryLargeVerticalPadding(context)),
                child: VariableSizeTextField(textLeft,
                    TextSizeConstants.BUTTON_MEDIUM, TextAlign.center),
              ),
            ),
          ),
        ),
        Expanded(
          child: AdjustablePadding(
            paddingKind: PaddingKind.large,
            child: ElevatedButton(
              onPressed: callbackRight == null ? null : () => callbackRight!(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical:
                        DimensionHelper.veryLargeVerticalPadding(context)),
                child: VariableSizeTextField(
                  textRight,
                  TextSizeConstants.BUTTON_MEDIUM,
                  TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
