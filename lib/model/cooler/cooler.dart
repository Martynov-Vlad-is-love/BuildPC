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
// Cooler.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       name = json["name"] as int,
//       producer = json["producer"] as CoolerProducer,
//       socket = json["socket"] as CoolerSocket,
//       connector = json["connector"] as int,
//       material = json["material"] as CoolerMaterial,
//       maxTDP = json["maxTDP"] as int,
//       supportedSockets = json["supportedSockets"] as int,
//       thermotubes = json["thermotubes"] as int;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "name": name,
//     "connector": connector.toString(),
//     "material": material.toString(),
//     "maxTDP": maxTDP.toString(),
//     "supportedSockets": supportedSockets.toString(),
//     "thermotubes": thermotubes.toString(),
//   };
//
//   return data;
// }
}
