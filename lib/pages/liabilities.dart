import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/two_text_field_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Liabilities extends StatelessWidget {
  static const String ROUTE_ID = "/liabilities";

  const Liabilities();

  @override
  Widget build(BuildContext context) {
    final player = Player.getInstance();

    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TwoTextFieldRow("Home mortgage:", "${player.totalMortgage}", 19),
          TwoTextFieldRow("Student loan:", "${player.totalStudentLoan}", 19),
          TwoTextFieldRow("Car loan:", "${player.totalCarLoan}", 19),
          TwoTextFieldRow(
              "Credit card debt:", "${player.totalCreditCardDebt}", 19),
          TwoTextFieldRow("Bank loan:", "${state.bankLoan}", 19),
          TwoTextFieldRow("Real estate/companies:", "Mortgages:", 19),
          Expanded(
            child: ListView.builder(
              itemCount: state.holdings.length,
              itemBuilder: (context, i) {
                final holding = state.holdings[i];
                return ListTile(
                  title: TwoTextFieldRow(
                      "${holding.name}", "${holding.mortgage}", 19),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
