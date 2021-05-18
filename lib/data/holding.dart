import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Holding extends Equatable {
  final String name;
  final double downPayment;
  final double buyingCost;
  final double mortgage;
  final double cashflow;

  const Holding({
    required this.name,
    required this.downPayment,
    required this.buyingCost,
    required this.mortgage,
    required this.cashflow,
  });

  @override
  List<Object> get props => [name, downPayment, buyingCost, mortgage, cashflow];
}
