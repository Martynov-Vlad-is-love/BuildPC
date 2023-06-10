import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cpu_generation.g.dart';

@JsonSerializable()
class CPUGeneration implements Model{
  final int? id;
  String name;

  CPUGeneration(this.id, {required this.name});

  factory CPUGeneration.fromJson(Map<String, dynamic> json) =>
      _$CPUGenerationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CPUGenerationToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), name];

    return fields;
  }
}
