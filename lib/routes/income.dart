import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/widgets/two_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class Income extends StatelessWidget {

  static const String ROUTE_ID = "/income";
  static const String TITLE_FOR_APP_BAR = "Your income";

  // TODO Pass this state around with Provider and Consumer
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

  const Income();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: const TwoTextFieldRow(
              "Kind",
              "Cashflow",
              32,
              customTextAlign: TextAlign.center,
            ),
          ),
          TwoTextFieldRow("Salary:", "4200", 19),
          TwoTextFieldRow("Interests & dividends:", "400", 19),
          Padding(
            padding: const EdgeInsets.only(top: 19),
            child: VariableSizeTextField(
              "Real estate & company holdings:",
              25,
              TextAlign.left,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _player.holdings.length,
              itemBuilder: (context, i) {
                final holding = _player.holdings[i];
                return ListTile(
                  title: TwoTextFieldRow(
                    "${holding.name}",
                    "${holding.cashflow}",
                    18,
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
