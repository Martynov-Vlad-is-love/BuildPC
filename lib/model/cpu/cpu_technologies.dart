import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cpu_technologies.g.dart';

@JsonSerializable()
class CPUTechnologies implements Model{
  final int? id;
  String name;

  CPUTechnologies(this.id, this.name);

  factory CPUTechnologies.fromJson(Map<String, dynamic> json) =>
      _$CPUTechnologiesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CPUTechnologiesToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), name];

    return fields;
  }
}
