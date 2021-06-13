import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_state.g.dart';

@JsonSerializable()
class GameState extends Equatable {
  final String currentPageRoute;

  GameState(this.currentPageRoute);

  GameState copyWithPageRoute(String pageRoute) {
    return GameState(pageRoute);
  }

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);

  Map<String, dynamic> toJson() => _$GameStateToJson(this);

  @override
  List<Object?> get props => [currentPageRoute];

}
