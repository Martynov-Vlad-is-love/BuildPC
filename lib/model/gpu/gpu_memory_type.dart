import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gpu_memory_type.g.dart';

@JsonSerializable()
class GPUMemoryType implements Model{
  final int? id;
  String type;

  GPUMemoryType(this.id, {required this.type});

  factory GPUMemoryType.fromJson(Map<String, dynamic> json) =>
      _$GPUMemoryTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GPUMemoryTypeToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), type];

    return fields;
  }
}
