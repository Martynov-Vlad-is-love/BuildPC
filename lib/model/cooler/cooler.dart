import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/model/cooler/cooler_socket.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cooler.g.dart';

@JsonSerializable()
class Cooler implements Model{
  final int? id;
  String name;
  Producers producer;
  List<CoolerSocket> socket;
  CoolerMaterial material;
  int maxTDP;
  int supportedSockets;
  int thermotubes;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

  Cooler(this.id,
      this.name,
      this.producer,
      this.socket,
      this.material,
      this.maxTDP,
      this.supportedSockets,
      this.thermotubes,
      this.description,
      this.recommendedPrice,
      this.performanceLevel,
      );
  factory Cooler.fromJson(Map<String, dynamic> json) => _$CoolerFromJson(json);

  List<dynamic> modelFields() {
    final List<dynamic> fields = [
      id.toString(),
      name,
      producer,
      socket.toString(),
      material,
      maxTDP.toString(),
      supportedSockets.toString(),
      thermotubes.toString(),
      description,
      recommendedPrice.toString(),
      performanceLevel
    ];

    return fields;
  }

    @override
  List<String> parsedModels() {
      final List<String> socketList = [];
      for(final socket in socket){
        socketList.add(socket.socket);
      }
    final List<String> fields = [
      id.toString(),
      name,
      producer.name,
      socketList.toString(),
      material.material,
      maxTDP.toString(),
      supportedSockets.toString(),
      thermotubes.toString(),
      description,
      recommendedPrice.toString(),
      performanceLevel.level
    ];

    return fields;
  }

  @override
  Map<String, dynamic> toJson() => _$CoolerToJson(this);
}
