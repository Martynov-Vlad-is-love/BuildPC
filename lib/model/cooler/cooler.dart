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
  int maxTdp;
  int supportedSockets;
  int thermalTubes;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

  Cooler({
    this.id,
    required this.name,
    required this.producer,
    required this.socket,
    required this.material,
    required this.maxTdp,
    required this.supportedSockets,
    required this.thermalTubes,
    required this.description,
    required this.recommendedPrice,
    required this.performanceLevel,
  });
  factory Cooler.fromJson(Map<String, dynamic> json) => _$CoolerFromJson(json);

  List<dynamic> modelFields() {
    final List<dynamic> fields = [
      id.toString(),
      name,
      producer,
      socket.toString(),
      material,
      maxTdp.toString(),
      supportedSockets.toString(),
      thermalTubes.toString(),
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
      maxTdp.toString(),
      supportedSockets.toString(),
      thermalTubes.toString(),
      description,
      recommendedPrice.toString(),
      performanceLevel.level
    ];

    return fields;
  }

  @override
  Map<String, dynamic> toJson() => _$CoolerToJson(this);
}
