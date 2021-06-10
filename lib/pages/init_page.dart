import 'package:cashflow_sheet_helper/pages/overview.dart';
import 'package:cashflow_sheet_helper/state/game/events/profession_chosen.dart';
import 'package:cashflow_sheet_helper/state/game/game_bloc.dart';
import 'package:cashflow_sheet_helper/state/navigation/events/page_switched.dart';
import 'package:cashflow_sheet_helper/state/navigation/page_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/events/profession_initialized.dart';
import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitPage extends StatelessWidget {
  final TextEditingController _professionTitleController =
      TextEditingController();
  final TextEditingController _dreamController = TextEditingController();
  final TextEditingController _activeIncomeController = TextEditingController();
  final TextEditingController _monthlyTaxesController = TextEditingController();
  final TextEditingController _monthlyMortgageOrRentController = TextEditingController();
  final TextEditingController _monthlyStudentLoanController = TextEditingController();
  final TextEditingController _monthlyCarExpensesController = TextEditingController();
  final TextEditingController _monthlyCreditCardLoanController = TextEditingController();
  final TextEditingController _monthlyChildExpensesController = TextEditingController();
  final TextEditingController _monthlyOtherExpensesController = TextEditingController();
  final TextEditingController _savingsController = TextEditingController();
  final TextEditingController _totalMortgageController = TextEditingController();
  final TextEditingController _totalStudentLoanController = TextEditingController();
  final TextEditingController _totalCarLoanController = TextEditingController();
  final TextEditingController _totalCreditCardDebtController = TextEditingController();

  static const ROUTE_ID = "/init";

  InitPage();

  @override
  Widget build(BuildContext context) {
    final gameBloc = context.watch<GameBloc>();
    final pageBloc = context.watch<PageBloc>();
    final playerBloc = context.watch<PlayerBloc>();

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PaddedInputTextField("Profession", _professionTitleController),
            PaddedInputTextField("Dream", _dreamController),
            PaddedInputTextField(
              "Active Income",
              _activeIncomeController,
              textInputType: TextInputType.number,
            ),
            PaddedInputTextField("Monthly Taxes", _monthlyTaxesController),
            PaddedInputTextField("Monthly Mortgage Or Rent", _monthlyMortgageOrRentController),
            PaddedInputTextField("Monthly Student Loan", _monthlyStudentLoanController),
            PaddedInputTextField("Monthly Car Expenses", _monthlyCarExpensesController),
            PaddedInputTextField("Monthly Credit Card Loan", _monthlyCreditCardLoanController),
            PaddedInputTextField("Monthly Other Expenses", _monthlyOtherExpensesController),
            PaddedInputTextField("Monthly Child Expenses", _monthlyChildExpensesController),
            PaddedInputTextField("Savings", _savingsController),
            PaddedInputTextField("Total Mortgages", _totalMortgageController),
            PaddedInputTextField("Total Student Loan", _totalStudentLoanController),
            PaddedInputTextField("Total Car Loan", _totalCarLoanController),
            PaddedInputTextField("Total Credit Card Debt", _totalCreditCardDebtController),
            ElevatedButton(
              onPressed: () =>
                  _processGameStart(playerBloc, gameBloc, pageBloc),
              child: const Text("Start Game!"),
            ),
            ElevatedButton(
              onPressed: () =>
                  _processGameStartWithDummyState(playerBloc, gameBloc, pageBloc),
              child: const Text("Use pre-populated state"),
            ),
          ],
        ),
      ),
    );
  }

  void _processGameStart(PlayerBloc playerBloc, GameBloc gameBloc, PageBloc pageBloc) {

    Map<String, dynamic> professionData = {
      "title": _professionTitleController.text,
      "dream": _dreamController.text,
      "activeIncome": double.parse(_activeIncomeController.text),
      "taxes": double.parse(_monthlyTaxesController.text),
      "monthlyMortgageOrRent": double.parse(_monthlyMortgageOrRentController.text),
      "monthlyStudentLoan": double.parse(_monthlyStudentLoanController.text),
      "monthlyCarLoan": double.parse(_monthlyCarExpensesController.text),
      "monthlyCreditCardLoan": double.parse(_monthlyCreditCardLoanController.text),
      "monthlyChildExpenses": double.parse(_monthlyChildExpensesController.text),
      "monthlyOtherExpenses": double.parse(_monthlyOtherExpensesController.text),
      "savings": double.parse(_savingsController.text),
      "totalMortgage": double.parse(_totalMortgageController.text),
      "totalStudentLoan": double.parse(_totalStudentLoanController.text),
      "totalCarLoan": double.parse(_totalCarLoanController.text),
      "totalCreditCardDebt": double.parse(_totalCreditCardDebtController.text),
      "bankLoan": 0.toDouble(),
      "numChildren": 0,
      "numGoldCoins": 0,
      // Initial cash = initial cashflow + savings
      "balance": 4900.0 + 3500.0,
    };

    _process(playerBloc, gameBloc, pageBloc, professionData);

  }

  void _processGameStartWithDummyState(
      PlayerBloc playerBloc, GameBloc gameBloc, PageBloc pageBloc) {
    Map<String, dynamic> professionData = {
      "title": "Doctor",
      "dream": "Complete financial independence",
      "activeIncome": 13200.toDouble(),
      "taxes": 3200.toDouble(),
      "monthlyMortgageOrRent": 1900.toDouble(),
      "monthlyStudentLoan": 700.toDouble(),
      "monthlyCarLoan": 300.toDouble(),
      "monthlyCreditCardLoan": 200.toDouble(),
      "monthlyChildExpenses": 700.toDouble(),
      "monthlyOtherExpenses": 2000.toDouble(),
      "savings": 3500.toDouble(),
      "totalMortgage": 202000.toDouble(),
      "totalStudentLoan": 150000.toDouble(),
      "totalCarLoan": 19000.toDouble(),
      "totalCreditCardDebt": 10000.toDouble(),
      "bankLoan": 0.toDouble(),
      "numChildren": 0,
      "numGoldCoins": 0,
      // Initial cash = initial cashflow + savings
      "balance": 4900.0 + 3500.0,
    };

    _process(playerBloc, gameBloc, pageBloc, professionData);


  }

  void _process(PlayerBloc playerBloc, GameBloc gameBloc, PageBloc pageBloc, Map<String, dynamic> professionData) {

    gameBloc.add(const ProfessionChosen());
    playerBloc.add(ProfessionInitialized(professionData));
    pageBloc.add(const PageSwitched(Overview.ROUTE_ID));


  }
}
