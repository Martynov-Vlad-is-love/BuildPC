import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ram_memory_type.g.dart';

@JsonSerializable()
class RamMemoryType implements Model{
  final int? id;
  String memoryType;

  RamMemoryType(this.id, this.memoryType);

  factory RamMemoryType.fromJson(Map<String, dynamic> json) =>
      _$RamMemoryTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RamMemoryTypeToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), memoryType];

    return fields;
  }
}
