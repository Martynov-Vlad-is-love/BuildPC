import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/cpu/cpu_pcie_controller.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'processor.g.dart';

@JsonSerializable()
class Processor {
  final int id;
  int name;
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
}
