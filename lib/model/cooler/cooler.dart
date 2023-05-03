import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/model/cooler/cooler_producer.dart';
import 'package:buildpc/model/cooler/cooler_socket.dart';

class Cooler {
  final int id;
  int name;
  CoolerProducer producer;
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

  Cooler.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        name = json["name"] as int,
        producer = json["producer"] as CoolerProducer,
        socket = json["socket"] as CoolerSocket,
        connector = json["connector"] as int,
        material = json["material"] as CoolerMaterial,
        maxTDP = json["maxTDP"] as int,
        supportedSockets = json["supportedSockets"] as int,
        thermotubes = json["thermotubes"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "name": name,
      "connector": connector.toString(),
      "material": material.toString(),
      "maxTDP": maxTDP.toString(),
      "supportedSockets": supportedSockets.toString(),
      "thermotubes": thermotubes.toString(),
    };

    return data;
  }
}
