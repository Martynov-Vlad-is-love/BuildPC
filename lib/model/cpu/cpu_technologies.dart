import 'package:json_annotation/json_annotation.dart';

part 'cpu_technologies.g.dart';

@JsonSerializable()
class CPUTechnologies {
  final int id;
  String name;

  CPUTechnologies(this.id, this.name);

  factory CPUTechnologies.fromJson(Map<String, dynamic> json) =>
      _$CPUTechnologiesFromJson(json);

  Map<String, dynamic> toJson() => _$CPUTechnologiesToJson(this);
}
