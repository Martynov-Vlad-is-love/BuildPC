import 'package:json_annotation/json_annotation.dart';

part 'performance_level.g.dart';

@JsonSerializable()
class PerformanceLevel {
  final int id;
  String level;

  PerformanceLevel(this.id, this.level);

  factory PerformanceLevel.fromJson(Map<String, dynamic> json) =>
      _$PerformanceLevelFromJson(json);

  Map<String, dynamic> toJson() => _$PerformanceLevelToJson(this);
// PerformanceLevel.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       performanceLevel = json["performanceLevel"] as List<String>;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "performanceLevel": performanceLevel,
//   };
//
//   return data;
// }
}
