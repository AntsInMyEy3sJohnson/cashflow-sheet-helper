// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Holding _$HoldingFromJson(Map<String, dynamic> json) {
  return Holding(
    name: json['name'] as String,
    holdingKind: _$enumDecode(_$HoldingKindEnumMap, json['holdingKind']),
    numUnits: json['numUnits'] as int,
    downPayment: (json['downPayment'] as num).toDouble(),
    buyingCost: (json['buyingCost'] as num).toDouble(),
    mortgage: (json['mortgage'] as num).toDouble(),
    cashflow: (json['cashflow'] as num).toDouble(),
  );
}

Map<String, dynamic> _$HoldingToJson(Holding instance) => <String, dynamic>{
      'name': instance.name,
      'holdingKind': _$HoldingKindEnumMap[instance.holdingKind],
      'numUnits': instance.numUnits,
      'downPayment': instance.downPayment,
      'buyingCost': instance.buyingCost,
      'mortgage': instance.mortgage,
      'cashflow': instance.cashflow,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$HoldingKindEnumMap = {
  HoldingKind.singleFamilyHouse: 'singleFamilyHouse',
  HoldingKind.multiFamilyHouse: 'multiFamilyHouse',
  HoldingKind.apartmentHouse: 'apartmentHouse',
  HoldingKind.condominium: 'condominium',
};
