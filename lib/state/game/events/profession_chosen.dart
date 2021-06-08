import 'package:cashflow_sheet_helper/state/game/events/game_event.dart';

class ProfessionChosen extends GameEvent {

  final Map<String, dynamic> professionData;

  const ProfessionChosen(this.professionData);

}