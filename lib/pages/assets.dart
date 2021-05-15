import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/widgets/asset_list.dart';
import 'package:cashflow_sheet_helper/widgets/holding_list.dart';
import 'package:cashflow_sheet_helper/widgets/three_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/two_text_field_row.dart';
import 'package:flutter/material.dart';

class Assets extends StatelessWidget {
  static const String ROUTE_ID = "/assets";

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
          child: const AssetList(),
        ),
        ThreeTextFieldRow(
            "Real estate/companies:", "Down payment:", "Cost:", 19),
        Expanded(
          child: const HoldingList()
        ),
      ],
    );
  }
}
