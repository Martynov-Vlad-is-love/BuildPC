import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'processor.g.dart';

@JsonSerializable()
class Processor implements Model {
  final int? id;
  String name;
  Producers producer;
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
  CPUPCIeVersion pcieVersion;
  CPUTechnologies technologies;
  String description;

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
    this.pcieVersion,
    this.technologies,
    this.description, {
    required this.embeddedGraphics,
  });

  factory Processor.fromJson(Map<String, dynamic> json) =>
      _$ProcessorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProcessorToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [
      id.toString(),
      name,
      producer.name,
      yearOfRelease.toString(),
      socket.socket,
      countOfCores.toString(),
      countOfThreads.toString(),
      baseFrequency.toString(),
      turboBoostFrequency.toString(),
      l3Cache.toString(),
      generation.name,
      technicalProcess.toString(),
      tdp.toString(),
      maxTemperature.toString(),
      embeddedGraphics.toString(),
      pcieVersion.name,
      technologies.name,
      description
    ];

    return fields;
  }
}
