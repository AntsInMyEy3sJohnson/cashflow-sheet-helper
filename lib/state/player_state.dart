import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:equatable/equatable.dart';

class PlayerState extends Equatable {

  final List<Asset> assets;

  const PlayerState(this.assets);

  PlayerState copyWith(List<Asset> assets) {
    return PlayerState(assets);
  }

  @override
  List<Object> get props => [assets];

}