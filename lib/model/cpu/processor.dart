import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'processor.g.dart';

@JsonSerializable()
class Processor implements Model {
  final int? id;
  String? name;
  Producers? producer;
  MotherboardSocket? socket;
  int? yearOfRelease;
  int? countOfCores;
  int? countOfThreads;
  double? baseFrequency;
  double? turboFrequency;
  int? l3Cache;
  CPUGeneration? cpuGeneration;
  int? technicalProcess;
  int? tdp;
  int? maxTemperature;
  bool? embeddedGraphic;
  CPUPCIeVersion? pcieVersion;
  List<CPUTechnologies?>? cpuTechnologies;
  String? description;
  int? recommendedPrice;
  PerformanceLevel? performanceLevel;

  Processor({
    this.id,
    required this.name,
    required this.producer,
    required this.yearOfRelease,
    required this.socket,
    required this.countOfCores,
    required this.countOfThreads,
    required this.baseFrequency,
    required this.turboFrequency,
    required this.l3Cache,
    required this.cpuGeneration,
    required this.technicalProcess,
    required this.tdp,
    required this.maxTemperature,
    required this.embeddedGraphic,
    required this.pcieVersion,
    required this.cpuTechnologies,
    required this.description,
    required this.recommendedPrice,
    required this.performanceLevel,
  });

  factory Processor.fromJson(Map<String, dynamic> json) =>
      _$ProcessorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProcessorToJson(this);

  @override
  List<String> parsedModels() {
    final technology = [];
    if(cpuTechnologies != null){
      for (final con in cpuTechnologies!) {
        technology.add(con?.name);
      }
    }
    else {
      technology.add('');
    }

    final List<String> fields = [
      id.toString(),
      name.toString(),
      '${producer?.name}',
      yearOfRelease.toString(),
      '${socket?.socket}',
      countOfCores.toString(),
      countOfThreads.toString(),
      baseFrequency.toString(),
      turboFrequency.toString(),
      l3Cache.toString(),
      '${cpuGeneration?.name}',
      technicalProcess.toString(),
      tdp.toString(),
      maxTemperature.toString(),
      embeddedGraphic.toString(),
      '${pcieVersion?.name}',
      technology.toString(),
      description.toString(),
      recommendedPrice.toString(),
      '${performanceLevel?.level}'
    ];

    return fields;
  }
}
