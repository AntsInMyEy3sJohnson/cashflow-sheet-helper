import 'package:cashflow_sheet_helper/state/player/events/player_event.dart';

class ProfessionInitialized extends PlayerEvent {

  final Map<String, dynamic> professionData;

  const ProfessionInitialized(this.professionData);

}