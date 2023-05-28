import 'package:json_annotation/json_annotation.dart';

part 'cpu_generation.g.dart';

@JsonSerializable()
class CPUGeneration {
  final int id;
  String name;

  CPUGeneration(this.id, this.name);

  factory CPUGeneration.fromJson(Map<String, dynamic> json) =>
      _$CPUGenerationFromJson(json);

  Map<String, dynamic> toJson() => _$CPUGenerationToJson(this);
}
