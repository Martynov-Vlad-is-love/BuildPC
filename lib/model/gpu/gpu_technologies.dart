import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gpu_technologies.g.dart';

@JsonSerializable()
class GPUTechnologies implements Model{
  final int? id;
  String name;

  GPUTechnologies(this.id, this.name);

  factory GPUTechnologies.fromJson(Map<String, dynamic> json) =>
      _$GPUTechnologiesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GPUTechnologiesToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), name];

    return fields;
  }
}
