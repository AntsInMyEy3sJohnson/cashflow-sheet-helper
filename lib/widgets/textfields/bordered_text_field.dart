import 'package:cashflow_sheet_helper/widgets/constants/color_constants.dart';
import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/helpers/dimension_helper.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class BorderedTextField extends StatelessWidget {
  final String text;

  const BorderedTextField(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 180,
      ),
      padding: EdgeInsets.symmetric(
          vertical: DimensionHelper.mediumVerticalPadding(context),
          horizontal: DimensionHelper.mediumHorizontalPadding(context)),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstants.TEXT_FIELD_BORDER,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: VariableSizeTextField(text, TextSizeConstants.TEXT_FIELD_CONTENT_LARGE, TextAlign.right),
    );
  }
}
