import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/model/ram/ram_timings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ram.g.dart';

@JsonSerializable()
class Ram {
  final int id;
  int name;
  Producers producer;
  RamMemoryType memoryType;
  int memoryCapacity;
  int frequency;
  RamTimings timings;
  double powerSupplyVoltage;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

  Ram(
    this.id,
    this.name,
    this.producer,
    this.memoryType,
    this.memoryCapacity,
    this.frequency,
    this.timings,
    this.powerSupplyVoltage,
    this.description,
    this.recommendedPrice,
    this.performanceLevel,
  );

  factory Ram.fromJson(Map<String, dynamic> json) => _$RamFromJson(json);

  Map<String, dynamic> toJson() => _$RamToJson(this);
}
