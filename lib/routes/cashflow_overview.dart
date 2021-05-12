import 'package:cashflow_sheet_helper/data/profession.dart';
import 'package:cashflow_sheet_helper/widgets/styled_text_field.dart';
import 'package:flutter/material.dart';

class CashflowOverview extends StatelessWidget {
  static const ROUTE_ID = "/";

  static final Profession _profession = Profession.withProperties(
      title: "Docor",
      activeIncome: 13200,
      taxes: 3200,
      mortgageOrRent: 1900,
      studentLoan: 700,
      carLoan: 300,
      creditCardLoan: 200,
      otherExpenses: 2000,
      assets: 3500);

  const CashflowOverview();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StyledTextField("${_profession.activeIncome}"),
            StyledTextField("${_profession.passiveIncome}"),
            StyledTextField("${_profession.totalIncome}"),
            StyledTextField("${_profession.totalExpenses}"),
            StyledTextField("${_profession.cashflow}"),
          ],
        ),
      ),
    );
  }
}
