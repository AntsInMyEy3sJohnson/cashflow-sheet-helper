import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:flutter/cupertino.dart';

class Player {
  final String title;
  final String dream;

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
  List<Holding> holdings;

  Player.withProperties({
    @required this.title,
    @required this.dream,
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
    // Create some dummy holdings to work with
    this.holdings = _generateDummyHoldings();
  }

  List<Holding> _generateDummyHoldings() {

    return <Holding>[
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
      Holding(name: "EFH", downPayment: 16000, buyingCost: 275000, mortgage: 259000, cashflow: 1000),
    ];

  }
}
