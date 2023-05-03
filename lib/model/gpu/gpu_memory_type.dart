import 'package:json_annotation/json_annotation.dart';

part 'gpu_memory_type.g.dart';

@JsonSerializable()
class GPUMemoryType {
  final int id;
  String type;

  GPUMemoryType(this.id, this.type);

  factory GPUMemoryType.fromJson(Map<String, dynamic> json) =>
      _$GPUMemoryTypeFromJson(json);

  Map<String, dynamic> toJson() => _$GPUMemoryTypeToJson(this);
// GPUMemoryType.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       type = json["type"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "type": type,
//   };
//
//   return data;
// }
}
