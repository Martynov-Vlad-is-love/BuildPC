import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motherboard_network.g.dart';

@JsonSerializable()
class MotherboardNetwork implements Model {
  final int? id;
  String network;

  MotherboardNetwork(this.id, this.network);

  factory MotherboardNetwork.fromJson(Map<String, dynamic> json) =>
      _$MotherboardNetworkFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MotherboardNetworkToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), network];

    return fields;
  }
}
