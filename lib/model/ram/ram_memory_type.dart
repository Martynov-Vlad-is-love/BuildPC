import 'package:json_annotation/json_annotation.dart';

part 'ram_memory_type.g.dart';

@JsonSerializable()
class RamMemoryType {
  final int id;
  String memoryType;

  RamMemoryType(this.id, this.memoryType);

  factory RamMemoryType.fromJson(Map<String, dynamic> json) =>
      _$RamMemoryTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RamMemoryTypeToJson(this);
}
