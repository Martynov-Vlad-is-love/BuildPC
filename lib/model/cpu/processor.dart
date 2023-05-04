import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/cpu/cpu_pcie_controller.dart';
import 'package:buildpc/model/cpu/cpu_producer.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'processor.g.dart';

@JsonSerializable()
class Processor {
  final int id;
  int name;
  CPUProducer producer;
  MotherboardSocket socket;
  int yearOfRelease;
  int countOfCores;
  int countOfThreads;
  double baseFrequency;
  double turboBoostFrequency;
  int l3Cache;
  CPUGeneration generation;
  int technicalProcess;
  int tdp;
  int maxTemperature;
  bool embeddedGraphics;
  CPUPCIeController pcieController;
  int description;

  Processor(
    this.id,
    this.name,
    this.producer,
    this.yearOfRelease,
    this.socket,
    this.countOfCores,
    this.countOfThreads,
    this.baseFrequency,
    this.turboBoostFrequency,
    this.l3Cache,
    this.generation,
    this.technicalProcess,
    this.tdp,
    this.maxTemperature,
    this.pcieController,
    this.description, {
    required this.embeddedGraphics,
  });

  factory Processor.fromJson(Map<String, dynamic> json) =>
      _$ProcessorFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessorToJson(this);
// Processor.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       name = json["name"] as int,
//       producer = json["producer"] as int,
//       yearOfRelease = json["yearOfRelease"] as int,
//       socket = json["socket"] as String,
//       countOfCores = json["countOfCores"] as int,
//       countOfThreads = json["countOfThreads"] as int,
//       baseFrequency = json["baseFrequency"] as double,
//       turboBoostFrequency = json["turboBoostFrequency"] as double,
//       l3Cache = json["l3Cache"] as int,
//       generation = json["generation"] as int,
//       technicalProcess = json["technicalProcess"] as int,
//       tdp = json["tdp"] as int,
//       maxTemperature = json["maxTemperature"] as int,
//       embeddedGraphics = json["embeddedGraphics"] as bool,
//       pcieController = json["PCIeController"] as int,
//       otherCPUTechnologies = json["otherCPUTechnologies"] as int;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "name": name.toString(),
//     "producer": producer.toString(),
//     "yearOfRelease": yearOfRelease.toString(),
//     "socket": socket,
//     "countOfCores": countOfCores.toString(),
//     "countOfThreads": countOfThreads.toString(),
//     "baseFrequency": baseFrequency.toString(),
//     "turboBoostFrequency": turboBoostFrequency.toString(),
//     "l3Cache": l3Cache.toString(),
//     "generation": generation.toString(),
//     "technicalProcess": technicalProcess.toString(),
//     "tdp": tdp.toString(),
//     "maxTemperature": maxTemperature.toString(),
//     "embeddedGraphics": embeddedGraphics.toString(),
//     "PCIeController": pcieController.toString(),
//     "otherCPUTechnologies": otherCPUTechnologies.toString(),
//   };
//
//   return data;
// }
}
