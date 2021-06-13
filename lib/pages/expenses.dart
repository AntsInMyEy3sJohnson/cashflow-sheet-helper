import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/rows/two_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/text_size_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Expenses extends StatelessWidget {
  static const String ROUTE_ID = "/expenses";

  const Expenses();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      final player = state.player;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TwoTextFieldRow("Taxes", "${player.taxes}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Mortgage/rent", "${player.monthlyMortgageOrRent}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Student loan", "${player.monthlyStudentLoan}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Car loan", "${player.monthlyCarLoan}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Credit card loan", "${player.monthlyCreditCardLoan}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Other expenses", "${player.monthlyOtherExpenses}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow("Bank loans", "${state.bankLoan}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
          TwoTextFieldRow(
              "Child expenses (${state.numChildren}x${player.monthlyChildExpenses})",
              "${state.totalChildExpenses}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
        ],
      );
    });
  }
}
