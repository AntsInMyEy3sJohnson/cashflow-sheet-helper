import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class AssetBought extends PlayerEvent {

  final String name;
  final int numShares;
  final double costPerShare;

  const AssetBought(this.name, this.numShares, this.costPerShare);

}