import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:flutter/cupertino.dart';

class Player {
  final String title;
  final String dream;

  final double activeIncome;
  final double taxes;
  final double monthlyMortgageOrRent;
  final double monthlyStudentLoan;
  final double monthlyCarLoan;
  final double monthlyCreditCardLoan;
  final double monthlyOtherExpenses;
  final double savings;

  final double totalMortgage;
  final double totalStudentLoan;
  final double totalCarLoan;
  final double totalCreditCardDebt;

  double bankLoan;
  int numChildren;
  double expensesPerChild;
  double totalChildExpenses;
  double passiveIncome;
  double totalIncome;
  double totalExpenses;
  double cashflow;
  List<Holding> holdings;
  List<Asset> assets;

  Player.withProperties({
    @required this.title,
    @required this.dream,
    @required this.activeIncome,
    @required this.taxes,
    @required this.monthlyMortgageOrRent,
    @required this.monthlyStudentLoan,
    @required this.monthlyCarLoan,
    @required this.monthlyCreditCardLoan,
    @required this.monthlyOtherExpenses,
    @required this.savings,
    @required this.totalMortgage,
    @required this.totalStudentLoan,
    @required this.totalCarLoan,
    @required this.totalCreditCardDebt,
  }) {
    this.bankLoan = 0;
    this.numChildren = 0;
    this.expensesPerChild = 0;
    this.totalChildExpenses = expensesPerChild * numChildren;
    this.passiveIncome = 0;
    this.totalIncome = activeIncome + passiveIncome;
    this.totalExpenses = taxes +
        monthlyMortgageOrRent +
        monthlyStudentLoan +
        monthlyCarLoan +
        monthlyCreditCardLoan +
        monthlyOtherExpenses;
    this.cashflow = totalIncome - totalExpenses;
    // Create some dummy holdings to work with
    this.holdings = _generateDummyHoldings();
    this.assets = _generateDummyAssets();
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

  List<Asset> _generateDummyAssets() {

    return <Asset>[
      Asset(name: "GRO4US", numShares: 42, costPerShare: 5),
      Asset(name: "GRO4US", numShares: 42, costPerShare: 5),
      Asset(name: "GRO4US", numShares: 42, costPerShare: 5),
      Asset(name: "GRO4US", numShares: 42, costPerShare: 5),
      Asset(name: "GRO4US", numShares: 42, costPerShare: 5),
    ];

  }

}
