import 'package:flutter/cupertino.dart';

class Profession {
  final String title;

  final double activeIncome;
  final double taxes;
  final double mortgageOrRent;
  final double studentLoan;
  final double carLoan;
  final double creditCardLoan;
  final double otherExpenses;
  final double assets;

  double bankLoan;
  int numChildren;
  double expensesPerChild;
  double passiveIncome;
  double totalIncome;
  double totalExpenses;
  double cashflow;

  Profession.withProperties({
    @required this.title,
    @required this.activeIncome,
    @required this.taxes,
    @required this.mortgageOrRent,
    @required this.studentLoan,
    @required this.carLoan,
    @required this.creditCardLoan,
    @required this.otherExpenses,
    @required this.assets,
  }) {
    this.bankLoan = 0;
    this.numChildren = 0;
    this.expensesPerChild = 0;
    this.passiveIncome = 0;
    this.totalIncome = activeIncome + passiveIncome;
    this.totalExpenses = taxes +
        mortgageOrRent +
        studentLoan +
        carLoan +
        creditCardLoan +
        otherExpenses;
    this.cashflow = totalIncome - totalExpenses;
  }
}
