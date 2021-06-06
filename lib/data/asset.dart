import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset.g.dart';

@JsonSerializable()
class Asset extends Equatable {
  final String name;
  final int numShares;
  final double costPerShare;

  const Asset(
      {required this.name,
      required this.numShares,
      required this.costPerShare});

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);

  @override
  List<Object> get props => [name, numShares, costPerShare];

}
