import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/widgets/bordered_text_field.dart';
import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  static const ROUTE_ID = "/";
  static const String TITLE_FOR_APP_BAR = "Cashflow Overview";

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

  const Overview();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BorderedTextField("${_player.activeIncome}"),
          BorderedTextField("${_player.passiveIncome}"),
          BorderedTextField("${_player.totalIncome}"),
          BorderedTextField("${_player.totalExpenses}"),
          BorderedTextField("${_player.cashflow}"),
        ],
      ),
    );
  }
}
