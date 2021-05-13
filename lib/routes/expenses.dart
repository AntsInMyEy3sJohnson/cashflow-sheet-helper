import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/widgets/two_text_field_row.dart';
import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {

  static const String ROUTE_ID = "/expenses";
  static const String TITLE_FOR_APP_BAR = "Your expenses";

  // TODO Pass this state around with Provider and Consumer
  // Or save and load using hydrated_bloc?

  static final Player _player = Player.withProperties(
      title: "Doctor",
      dream: "Magnum Ferrari",
      activeIncome: 13200,
      taxes: 3200,
      mortgageOrRent: 1900,
      studentLoan: 700,
      carLoan: 300,
      creditCardLoan: 200,
      otherExpenses: 2000,
      assets: 3500);

  const Expenses();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TwoTextFieldRow("Taxes", "${_player.taxes}", 19),
          TwoTextFieldRow("Mortgage/rent", "${_player.mortgageOrRent}", 19),
          TwoTextFieldRow("Student loan", "${_player.studentLoan}", 19),
          TwoTextFieldRow("Car loan", "${_player.carLoan}", 19),
          TwoTextFieldRow("Credit card loan", "${_player.creditCardLoan}", 19),
          TwoTextFieldRow("Other expenses", "${_player.otherExpenses}", 19),
          TwoTextFieldRow("Bank loans", "${_player.bankLoan}", 19),
          TwoTextFieldRow("Child expenses (${_player.numChildren}x${_player.expensesPerChild})", "${_player.totalChildExpenses}", 19),
        ],
      ),
    );
  }

}