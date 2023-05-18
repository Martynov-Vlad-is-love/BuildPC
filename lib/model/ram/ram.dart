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
// Ram.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int,
//       name = json['name'] as int,
//       producer = json['producer'] as int,
//       memoryType = json['memoryType'] as int,
//       memoryCapacity = json['memoryCapacity'] as int,
//       frequency = json['frequency'] as int,
//       timings = json['timings'] as int,
//       powerSupplyVoltage = json['powerSupplyVoltage'] as double;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "name": name.toString(),
//     "producer": producer.toString(),
//     "memoryType": memoryType.toString(),
//     "memoryCapacity": memoryCapacity.toString(),
//     "frequency": frequency.toString(),
//     "timings": timings.toString(),
//     "powerSupplyVoltage": powerSupplyVoltage.toString()
//   };
//
//   return data;
// }
}
