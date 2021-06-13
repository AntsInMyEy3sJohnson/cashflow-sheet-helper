import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/actionable_asset_list.dart';
import 'package:cashflow_sheet_helper/widgets/actionable_holding_list.dart';
import 'package:cashflow_sheet_helper/widgets/rows/actionable_gold_coins_row.dart';
import 'package:cashflow_sheet_helper/widgets/rows/three_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/rows/two_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/text_size_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Assets extends StatelessWidget {
  static const String ROUTE_ID = "/assets";

  const Assets();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TwoTextFieldRow(
              "Savings:", "${state.player.savings}", TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          const ActionableGoldCoinsRow(),
          ThreeTextFieldRow("Shares & fonds:", "# shares:", "Cost per share:",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          SizedBox(
            height: 200,
            child: const ActionableAssetList(),
          ),
          ThreeTextFieldRow("Real estate/companies:", "Down payment:", "Cost:",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          Expanded(child: const ActionableHoldingList()),
        ],
      );
    });
  }
}
