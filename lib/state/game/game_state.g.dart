// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return GameState(
    json['currentPageRoute'] as String,
    json['professionData'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$GameStateToJson(GameState instance) => <String, dynamic>{
      'currentPageRoute': instance.currentPageRoute,
      'professionData': instance.professionData,
    };
