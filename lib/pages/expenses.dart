import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/rows/two_text_field_row.dart';
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
          TwoTextFieldRow("Taxes", "${player.taxes}", 19),
          TwoTextFieldRow(
              "Mortgage/rent", "${player.monthlyMortgageOrRent}", 19),
          TwoTextFieldRow("Student loan", "${player.monthlyStudentLoan}", 19),
          TwoTextFieldRow("Car loan", "${player.monthlyCarLoan}", 19),
          TwoTextFieldRow(
              "Credit card loan", "${player.monthlyCreditCardLoan}", 19),
          TwoTextFieldRow(
              "Other expenses", "${player.monthlyOtherExpenses}", 19),
          TwoTextFieldRow("Bank loans", "${state.bankLoan}", 19),
          TwoTextFieldRow(
              "Child expenses (${state.numChildren}x${player.monthlyChildExpenses})",
              "${state.totalChildExpenses}",
              19),
        ],
      );
    });
  }
}
