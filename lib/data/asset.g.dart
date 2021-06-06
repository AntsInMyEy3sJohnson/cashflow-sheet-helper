// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return Asset(
    name: json['name'] as String,
    numShares: json['numShares'] as int,
    costPerShare: (json['costPerShare'] as num).toDouble(),
  );
}

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'name': instance.name,
      'numShares': instance.numShares,
      'costPerShare': instance.costPerShare,
    };
