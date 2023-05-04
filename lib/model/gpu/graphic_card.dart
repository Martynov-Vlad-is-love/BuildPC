import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/model/gpu/gpu_interface_type.dart';
import 'package:buildpc/model/gpu/gpu_memory_type.dart';
import 'package:buildpc/model/gpu/gpu_producer.dart';
import 'package:buildpc/model/gpu/gpu_to_connector.dart';
import 'package:buildpc/model/gpu/gpu_vendor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graphic_card.g.dart';

@JsonSerializable()
class GraphicCard {
  final int id;
  GPUProducer producer;
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
// GraphicCard.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int,
//       producer = json['producer'] as int,
//       name = json['name'] as int,
//       vendor = json['vendor'] as int,
//       year = json['year'] as int,
//       technicalProcess = json['technicalProcess'] as int,
//       gpuFrequency = json['gpuFrequency'] as int,
//       memorySize = json['memorySize'] as int,
//       memoryType = json['memoryType'] as int,
//       memoryFrequency = json['memoryFrequency'] as int,
//       bus = json['bus'] as int,
//       tdp = json['tdp'] as int,
//       connector = json['connector'] as int,
//       length = json['length'] as int,
//       interfaceType = json['interfaceType'] as int,
//       connectionType = json['connectionType'] as int,
//       directXVersion = json['directXVersion'] as int,
//       otherGPUTechnologies = json['otherGPUTechnologies'] as int;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "producer": producer.toString(),
//     "name": name.toString(),
//     "vendor": vendor.toString(),
//     "year": year.toString(),
//     "technicalProcess": technicalProcess.toString(),
//     "gpuFrequency": gpuFrequency.toString(),
//     "memorySize": memorySize.toString(),
//     "memoryType": memoryType.toString(),
//     "memoryFrequency": memoryFrequency.toString(),
//     "bus": bus.toString(),
//     "tdp": tdp.toString(),
//     "connector": connector.toString(),
//     "length": length.toString(),
//     "interfaceType": interfaceType.toString(),
//     "connectionType": connectionType.toString(),
//     "directXVersion": directXVersion.toString(),
//     "otherGPUTechnologies": otherGPUTechnologies.toString(),
//   };
//
//   return data;
// }
}
