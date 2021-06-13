import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/rows/two_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/text_size_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Liabilities extends StatelessWidget {
  static const String ROUTE_ID = "/liabilities";

  const Liabilities();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      final player = state.player;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TwoTextFieldRow("Home mortgage:", "${player.totalMortgage}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Student loan:", "${player.totalStudentLoan}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Car loan:", "${player.totalCarLoan}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Credit card debt:", "${player.totalCreditCardDebt}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Bank loan:", "${state.bankLoan}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Real estate/companies:", "Mortgages:",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          Expanded(
            child: ListView.builder(
              itemCount: state.holdings.length,
              itemBuilder: (context, i) {
                final holding = state.holdings[i];
                return ListTile(
                  title: TwoTextFieldRow(
                      "${holding.name}",
                      "${holding.mortgage}",
                      TextSizeConstants.TEXT_FIELD_ROW_ITEM),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
