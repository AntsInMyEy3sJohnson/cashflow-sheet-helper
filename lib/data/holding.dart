import 'package:flutter/cupertino.dart';

class Holding {
  final String name;
  final double downPayment;
  final double buyingCost;
  final double mortgage;
  final double cashflow;

  const Holding({
    @required this.name,
    @required this.downPayment,
    @required this.buyingCost,
    @required this.mortgage,
    @required this.cashflow,
  });
}
