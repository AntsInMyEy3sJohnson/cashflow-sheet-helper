import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class SharesSold extends PlayerEvent {

  final Asset asset;
  final int numSold;
  final double price;

  const SharesSold(this.asset, this.numSold, this.price);

}