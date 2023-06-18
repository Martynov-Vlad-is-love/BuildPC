import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cooler.g.dart';

@JsonSerializable()
class Cooler implements Model{
  final int? id;
  String? name;
  Producers? producer;
  List<MotherboardSocket?> socket;
  CoolerMaterial? material;
  int? maxTdp;
  int? thermalTubes;
  String? description;
  int? recommendedPrice;
  PerformanceLevel? performanceLevel;

  Cooler({
    this.id,
    required this.name,
    required this.producer,
    required this.material,
    required this.maxTdp,
    required this.socket,
    required this.thermalTubes,
    required this.description,
    required this.recommendedPrice,
    required this.performanceLevel,
  });
  factory Cooler.fromJson(Map<String, dynamic> json) => _$CoolerFromJson(json);

    @override
  List<String> parsedModels() {
      final List<String> sockets = [];
      for(final item in socket){
        sockets.add('${item?.socket}');
      }

      final List<String> fields = [
        id.toString(),
        '$name',
        '${producer?.name}',
        '${material?.material}',
        maxTdp.toString(),
        sockets.toString(),
        thermalTubes.toString(),
        '$description',
        recommendedPrice.toString(),
        '${performanceLevel?.level}'
      ];

    return fields;
  }

  @override
  Map<String, dynamic> toJson() => _$CoolerToJson(this);
}
