import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/model/gpu/gpu_interface_type.dart';
import 'package:buildpc/model/gpu/gpu_memory_type.dart';
import 'package:buildpc/model/gpu/gpu_technologies.dart';
import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graphic_card.g.dart';

@JsonSerializable()
class GraphicCard implements Model {
  final int? id;
  Producers producer;
  String name;
  Producers vendor;
  int year;
  int technicalProcess;
  int gpuFrequency;
  int memoryAmount;
  GPUMemoryType memoryType;
  int memoryFrequency;
  int bus;
  int tdp;
  List<GPUConnector> connector;
  GPUInterfaceType interfaceType;
  int length;
  String description;
  GPUTechnologies gpuTechnologies;
  int recommendedPrice;
  PerformanceLevel performanceLevel;


  GraphicCard({
    this.id,
    required this.producer,
    required this.name,
    required this.vendor,
    required this.year,
    required this.technicalProcess,
    required this.gpuFrequency,
    required this.memoryAmount,
    required this.memoryType,
    required this.memoryFrequency,
    required this.bus,
    required this.tdp,
    required this.connector,
    required this.interfaceType,
    required this.length,
    required this.description,
    required this.gpuTechnologies,
    required this.recommendedPrice,
    required this.performanceLevel,
  });

  factory GraphicCard.fromJson(Map<String, dynamic> json) =>
      _$GraphicCardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GraphicCardToJson(this);

  @override
  List<String> parsedModels() {
    final connectors = [];
    for(final con in connector){
      connectors.add(con.connector);
    }

    final fields = [
      id.toString(),
      producer.name,
      name,
      vendor.name,
      year.toString(),
      technicalProcess.toString(),
      gpuFrequency.toString(),
      memoryAmount.toString(),
      memoryType.type,
      memoryFrequency.toString(),
      bus.toString(),
      tdp.toString(),
      connectors.toString(),
      length.toString(),
      interfaceType.interfaceType,
      description,
      recommendedPrice.toString(),
      gpuTechnologies.name,
      performanceLevel.level
    ];

    return fields;
  }
}
