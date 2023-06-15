import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/model/ram/ram_timings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ram.g.dart';

@JsonSerializable()
class Ram implements Model {
  final int? id;
  String? name;
  Producers? producer;
  RamMemoryType? memoryType;
  int? memoryCapacity;
  int? frequency;
  RamTimings? timings;
  double? powerSupplyVoltage;
  String? description;
  int? recommendedPrice;
  PerformanceLevel? performanceLevel;

  Ram({
    this.id,
    required this.name,
    required this.producer,
    required this.memoryType,
    required this.memoryCapacity,
    required this.frequency,
    required this.timings,
    required this.powerSupplyVoltage,
    required this.description,
    required this.recommendedPrice,
    required this.performanceLevel,
  });

  factory Ram.fromJson(Map<String, dynamic> json) => _$RamFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RamToJson(this);

  @override
  List<String> parsedModels() {
    final List<String> fields = [
      id.toString(),
      '$name',
      '${producer?.name}',
      '${memoryType?.memoryType}',
      memoryCapacity.toString(),
      frequency.toString(),
      '${timings?.timings}',
      powerSupplyVoltage.toString(),
      '$description',
      recommendedPrice.toString(),
      '${performanceLevel?.level}'
    ];

    return fields;
  }
}
