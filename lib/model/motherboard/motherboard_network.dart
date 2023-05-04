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
// MotherboardNetwork.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       network = json["network"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "network": network,
//   };
//
//   return data;
// }
}
