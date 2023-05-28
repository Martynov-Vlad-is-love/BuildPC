import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/model/gpu/gpu_interface_type.dart';
import 'package:buildpc/model/gpu/gpu_memory_type.dart';
import 'package:buildpc/model/gpu/gpu_to_connector.dart';
import 'package:buildpc/model/gpu/gpu_vendor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graphic_card.g.dart';

@JsonSerializable()
class GraphicCard {
  final int id;
  Producers producer;
  int name;
  GPUVendor vendor;
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
  List<GPUToConnector> gpuTechnologies;
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

  Map<String, dynamic> toJson() => _$GraphicCardToJson(this);
}
