import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

/// Contains all properties about the player that
/// cannot change during a game, but are set only once
/// at the game's beginning.
@JsonSerializable()
class Player extends Equatable {
  final String title;
  final String dream;
  final double activeIncome;
  final double taxes;
  final double monthlyMortgageOrRent;
  final double monthlyStudentLoan;
  final double monthlyCarLoan;
  final double monthlyCreditCardExpenses;
  final double monthlyChildExpenses;
  final double monthlyOtherExpenses;
  final double savings;
  final double totalMortgage;
  final double totalStudentLoan;
  final double totalCarLoan;
  final double totalCreditCardDebt;

  static Player? _theInstance;

  static Player createInstance(
      {required String title,
      required String dream,
      required double activeIncome,
      required double taxes,
      required double monthlyMortgageOrRent,
      required double monthlyStudentLoan,
      required double monthlyCarLoan,
      required double monthlyCreditCardLoan,
      required double monthlyChildExpenses,
      required double monthlyOtherExpenses,
      required double savings,
      required double totalMortgage,
      required double totalStudentLoan,
      required double totalCarLoan,
      required double totalCreditCardDebt}) {
    _theInstance = Player(
        title: title,
        dream: dream,
        activeIncome: activeIncome,
        taxes: taxes,
        monthlyMortgageOrRent: monthlyMortgageOrRent,
        monthlyStudentLoan: monthlyStudentLoan,
        monthlyCarLoan: monthlyCarLoan,
        monthlyCreditCardExpenses: monthlyCreditCardLoan,
        monthlyChildExpenses: monthlyChildExpenses,
        monthlyOtherExpenses: monthlyOtherExpenses,
        savings: savings,
        totalMortgage: totalMortgage,
        totalStudentLoan: totalStudentLoan,
        totalCarLoan: totalCarLoan,
        totalCreditCardDebt: totalCreditCardDebt);
    return _theInstance!;
  }

  static Player getInstance() {
    return _theInstance!;
  }

  // Public constructor necessary for 'json_serializable' to generate parts file
  // for this class
  const Player({
    required this.title,
    required this.dream,
    required this.activeIncome,
    required this.taxes,
    required this.monthlyMortgageOrRent,
    required this.monthlyStudentLoan,
    required this.monthlyCarLoan,
    required this.monthlyCreditCardExpenses,
    required this.monthlyChildExpenses,
    required this.monthlyOtherExpenses,
    required this.savings,
    required this.totalMortgage,
    required this.totalStudentLoan,
    required this.totalCarLoan,
    required this.totalCreditCardDebt,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  @override
  List<Object?> get props => [
        title,
        dream,
        activeIncome,
        taxes,
        monthlyMortgageOrRent,
        monthlyStudentLoan,
        monthlyCarLoan,
        monthlyCreditCardExpenses,
        monthlyChildExpenses,
        monthlyOtherExpenses,
        savings,
        totalMortgage,
        totalStudentLoan,
        totalCarLoan,
        totalCreditCardDebt,
      ];
}
