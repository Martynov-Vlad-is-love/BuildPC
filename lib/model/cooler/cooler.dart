import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/model/cooler/cooler_socket.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cooler.g.dart';

@JsonSerializable()
class Cooler {
  final int id;
  int name;
  Producers producer;
  CoolerSocket socket;
  CoolerMaterial material;
  int connector;
  int maxTDP;
  int supportedSockets;
  int thermotubes;

  Cooler(
    this.id,
    this.name,
    this.producer,
    this.socket,
    this.connector,
    this.material,
    this.maxTDP,
    this.supportedSockets,
    this.thermotubes,
  );

  factory Cooler.fromJson(Map<String, dynamic> json) => _$CoolerFromJson(json);

  Map<String, dynamic> toJson() => _$CoolerToJson(this);
}
