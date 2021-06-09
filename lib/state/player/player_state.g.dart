// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerState _$PlayerStateFromJson(Map<String, dynamic> json) {
  return PlayerState(
    player: Player.fromJson(json['player'] as Map<String, dynamic>),
    bankLoan: (json['bankLoan'] as num).toDouble(),
    balance: (json['balance'] as num).toDouble(),
    numChildren: json['numChildren'] as int,
    numGoldCoins: json['numGoldCoins'] as int,
    holdings: (json['holdings'] as List<dynamic>)
        .map((e) => Holding.fromJson(e as Map<String, dynamic>))
        .toList(),
    assets: (json['assets'] as List<dynamic>)
        .map((e) => Asset.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PlayerStateToJson(PlayerState instance) =>
    <String, dynamic>{
      'player': instance.player.toJson(),
      'bankLoan': instance.bankLoan,
      'balance': instance.balance,
      'numChildren': instance.numChildren,
      'numGoldCoins': instance.numGoldCoins,
      'holdings': instance.holdings.map((e) => e.toJson()).toList(),
      'assets': instance.assets.map((e) => e.toJson()).toList(),
    };
