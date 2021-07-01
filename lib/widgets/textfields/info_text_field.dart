import 'package:cashflow_sheet_helper/widgets/constants/color_constants.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/info_text_kind.dart';
import 'package:flutter/material.dart';

class InfoTextField extends StatelessWidget {
  final String data;
  late final Color textColor;

  InfoTextField(this.data, {InfoTextKind infoTextKind = InfoTextKind.NEUTRAL}) {
    textColor = _resolveTextColorFromInfoKind(infoTextKind);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: textColor),
    );
  }

  Color _resolveTextColorFromInfoKind(InfoTextKind infoTextKind) {
    if(infoTextKind == InfoTextKind.GOOD) {
      return ColorConstants.GOOD_NEWS;
    }
    if (infoTextKind == InfoTextKind.BAD) {
      return ColorConstants.BAD_NEWS;
    }
    return ColorConstants.NEUTRAL_NEWS;
  }
}
