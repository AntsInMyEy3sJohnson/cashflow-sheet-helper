import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/widgets/actionable_asset_list.dart';
import 'package:cashflow_sheet_helper/widgets/actionable_holding_list.dart';
import 'package:cashflow_sheet_helper/widgets/three_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/two_text_field_row.dart';
import 'package:flutter/material.dart';

class Assets extends StatelessWidget {
  static const String ROUTE_ID = "/assets";

  const Assets();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TwoTextFieldRow("Savings:", "4500", 19),
        TwoTextFieldRow("Precious metals etc.:", "50", 19),
        ThreeTextFieldRow(
            "Shares & fonds:", "# shares:", "Cost per share:", 19),
        SizedBox(
          height: 200,
          child: const ActionableAssetList(),
        ),
        ThreeTextFieldRow(
            "Real estate/companies:", "Down payment:", "Cost:", 19),
        Expanded(child: const ActionableHoldingList()),
      ],
    );
  }
}
