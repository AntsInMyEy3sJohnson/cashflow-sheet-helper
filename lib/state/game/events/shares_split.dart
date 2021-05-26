import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class SharesSplit extends PlayerEvent {

  final Asset asset;

  const SharesSplit(this.asset);

}