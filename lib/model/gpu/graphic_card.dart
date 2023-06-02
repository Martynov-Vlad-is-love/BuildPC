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

  GraphicCard(
    this.id,
    this.producer,
    this.name,
    this.vendor,
    this.year,
    this.technicalProcess,
    this.gpuFrequency,
    this.memoryAmount,
    this.memoryType,
    this.memoryFrequency,
    this.bus,
    this.tdp,
    this.connector,
    this.length,
    this.interfaceType,
    this.description,
    this.recommendedPrice,
    this.gpuTechnologies,
    this.performanceLevel,
  );

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
      interfaceType.interfaceType,
      length.toString(),
      description,
      gpuTechnologies.name,
      recommendedPrice.toString(),
      performanceLevel.level
    ];

    return fields;
  }
}
