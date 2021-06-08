import 'package:cashflow_sheet_helper/pages/init_page.dart';
import 'package:cashflow_sheet_helper/pages/overview.dart';
import 'package:cashflow_sheet_helper/state/game/events/game_event.dart';
import 'package:cashflow_sheet_helper/state/game/events/game_restarted.dart';
import 'package:cashflow_sheet_helper/state/game/events/game_started.dart';
import 'package:cashflow_sheet_helper/state/game/events/profession_chosen.dart';
import 'package:cashflow_sheet_helper/state/game/game_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class GameBloc extends HydratedBloc<GameEvent, GameState> {

  GameBloc(GameState state) : super(state);

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is ProfessionChosen) {
      yield await _mapProfessionChosenToGameState(event.professionData);
    } else if (event is GameStarted) {
      yield await _mapGameStartedToGameState(event);
    } else if (event is GameRestarted) {
      yield await _mapGameRestartedToGameState();
    }
  }

  Future<GameState> _mapGameRestartedToGameState() async {
    // Game has been restarted, route to init page to
    // make player choose profession for new game run
    return state.copyWithPageRoute(InitPage.ROUTE_ID);
  }

  Future<GameState> _mapGameStartedToGameState(GameStarted event) async {
    if (event.stateExists) {
      // Previous state present exists -- route to overview page
      return state.copyWithPageRoute(Overview.ROUTE_ID);
    }
    // No previous state -- route to init page
    return state.copyWithPageRoute(InitPage.ROUTE_ID);
  }

  Future<GameState> _mapProfessionChosenToGameState(Map<String, dynamic> professionData) async {
    return state.copyWithPageRouteAndProfessionData(Overview.ROUTE_ID, professionData);
  }

  @override
  GameState? fromJson(Map<String, dynamic> json) {
    try {
      return GameState.fromJson(json);
    } catch (_) {
      print("Unable to load GameState object from device.");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(GameState state) {
    try {
      return state.toJson();
    } catch (_) {
      print("Unable to serialize GameState object to JSON.");
      return null;
    }
  }
}
