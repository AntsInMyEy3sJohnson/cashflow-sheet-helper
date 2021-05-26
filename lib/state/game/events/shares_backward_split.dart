import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class SharesBackwardSplit extends PlayerEvent {
  final Asset asset;

  const SharesBackwardSplit(this.asset);
}
