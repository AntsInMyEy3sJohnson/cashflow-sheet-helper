import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/state/player/events/player_event.dart';

class SharesBackwardSplit extends PlayerEvent {
  final Asset asset;

  const SharesBackwardSplit(this.asset);
}
