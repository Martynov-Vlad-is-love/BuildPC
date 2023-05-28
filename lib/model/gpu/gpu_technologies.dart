import 'package:json_annotation/json_annotation.dart';

part 'gpu_technologies.g.dart';

@JsonSerializable()
class GPUTechnologies {
  final int id;
  String name;

  GPUTechnologies(this.id, this.name);

  factory GPUTechnologies.fromJson(Map<String, dynamic> json) =>
      _$GPUTechnologiesFromJson(json);

  Map<String, dynamic> toJson() => _$GPUTechnologiesToJson(this);
}
