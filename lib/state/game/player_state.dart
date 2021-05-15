import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:equatable/equatable.dart';

class PlayerState extends Equatable {

  final List<Asset> assets;
  final List<Holding> holdings;

  const PlayerState(this.assets, this.holdings);

  PlayerState copyWithHoldings(List<Holding> holdings) {
    return PlayerState(this.assets, holdings);
  }

  PlayerState copyWithAssets(List<Asset> assets) {
    return PlayerState(assets, this.holdings);
  }

  @override
  List<Object> get props => [assets, holdings];

}