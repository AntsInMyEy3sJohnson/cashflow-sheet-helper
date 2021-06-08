import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_state.g.dart';

@JsonSerializable()
class GameState extends Equatable {
  final String currentPageRoute;
  final Map<String, dynamic> professionData;

  GameState(this.currentPageRoute, this.professionData);

  GameState copyWithPageRoute(String pageRoute) {
    return GameState(pageRoute, this.professionData);
  }

  GameState copyWithPageRouteAndProfessionData(String pageRoute, Map<String, dynamic> professionData) {
    return GameState(pageRoute, professionData);
  }

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);

  Map<String, dynamic> toJson() => _$GameStateToJson(this);

  @override
  List<Object?> get props => [currentPageRoute];
}
