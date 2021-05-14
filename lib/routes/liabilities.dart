import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/widgets/two_text_field_row.dart';
import 'package:flutter/material.dart';

class Liabilities extends StatelessWidget {

  static const String ROUTE_ID = "/liabilities";

  const Liabilities();

  static final Player _player = Player.withProperties(
      title: "Doctor",
      dream: "Magnum Ferrari",
      activeIncome: 13200,
      taxes: 3200,
      monthlyMortgageOrRent: 1900,
      monthlyStudentLoan: 700,
      monthlyCarLoan: 300,
      monthlyCreditCardLoan: 200,
      monthlyOtherExpenses: 2000,
      savings: 3500,
      totalMortgage: 202000,
      totalStudentLoan: 150000,
      totalCarLoan: 19000,
      totalCreditCardDebt: 10000);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TwoTextFieldRow("Home mortgage:", "${_player.totalMortgage}", 19),
          TwoTextFieldRow("Student loan:", "${_player.totalStudentLoan}", 19),
          TwoTextFieldRow("Car loan:", "${_player.totalCarLoan}", 19),
          TwoTextFieldRow("Credit card debt:", "${_player.totalCreditCardDebt}", 19),
          TwoTextFieldRow("Bank loan:", "${_player.bankLoan}", 19),
          TwoTextFieldRow("Real estate/companies:", "Mortgages:", 19),
          Expanded(
            child: ListView.builder(
              itemCount: _player.holdings.length,
              itemBuilder: (context, i) {
                final holding = _player.holdings[i];
                return ListTile(
                  title: TwoTextFieldRow(
                    "${holding.name}",
                    "${holding.mortgage}",
                    19
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



}