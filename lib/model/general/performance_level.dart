import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'performance_level.g.dart';

@JsonSerializable()
class PerformanceLevel implements Model {
  final int? id;
  String level;

  PerformanceLevel( this.id, {required this.level});

  factory PerformanceLevel.fromJson(Map<String, dynamic> json) =>
      _$PerformanceLevelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PerformanceLevelToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [
      id.toString(),
      level,
    ];

    return fields;
  }
}
