import 'package:json_annotation/json_annotation.dart';

part 'motherboard_network.g.dart';

@JsonSerializable()
class MotherboardNetwork {
  final int id;
  String network;

  MotherboardNetwork(this.id, this.network);

  factory MotherboardNetwork.fromJson(Map<String, dynamic> json) =>
      _$MotherboardNetworkFromJson(json);

  Map<String, dynamic> toJson() => _$MotherboardNetworkToJson(this);
}
