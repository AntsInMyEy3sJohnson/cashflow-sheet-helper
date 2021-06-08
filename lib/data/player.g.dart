// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
    title: json['title'] as String,
    dream: json['dream'] as String,
    activeIncome: (json['activeIncome'] as num).toDouble(),
    taxes: (json['taxes'] as num).toDouble(),
    monthlyMortgageOrRent: (json['monthlyMortgageOrRent'] as num).toDouble(),
    monthlyStudentLoan: (json['monthlyStudentLoan'] as num).toDouble(),
    monthlyCarLoan: (json['monthlyCarLoan'] as num).toDouble(),
    monthlyCreditCardLoan: (json['monthlyCreditCardLoan'] as num).toDouble(),
    monthlyChildExpenses: (json['monthlyChildExpenses'] as num).toDouble(),
    monthlyOtherExpenses: (json['monthlyOtherExpenses'] as num).toDouble(),
    savings: (json['savings'] as num).toDouble(),
    totalMortgage: (json['totalMortgage'] as num).toDouble(),
    totalStudentLoan: (json['totalStudentLoan'] as num).toDouble(),
    totalCarLoan: (json['totalCarLoan'] as num).toDouble(),
    totalCreditCardDebt: (json['totalCreditCardDebt'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'title': instance.title,
      'dream': instance.dream,
      'activeIncome': instance.activeIncome,
      'taxes': instance.taxes,
      'monthlyMortgageOrRent': instance.monthlyMortgageOrRent,
      'monthlyStudentLoan': instance.monthlyStudentLoan,
      'monthlyCarLoan': instance.monthlyCarLoan,
      'monthlyCreditCardLoan': instance.monthlyCreditCardLoan,
      'monthlyChildExpenses': instance.monthlyChildExpenses,
      'monthlyOtherExpenses': instance.monthlyOtherExpenses,
      'savings': instance.savings,
      'totalMortgage': instance.totalMortgage,
      'totalStudentLoan': instance.totalStudentLoan,
      'totalCarLoan': instance.totalCarLoan,
      'totalCreditCardDebt': instance.totalCreditCardDebt,
    };
