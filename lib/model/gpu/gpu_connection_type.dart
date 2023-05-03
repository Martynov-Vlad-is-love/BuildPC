import 'package:json_annotation/json_annotation.dart';

part 'gpu_connection_type.g.dart';

@JsonSerializable()
class GPUConnectionType {
  final int id;
  String connectionType;

  GPUConnectionType(this.id, this.connectionType);

  factory GPUConnectionType.fromJson(Map<String, dynamic> json) =>
      _$GPUConnectionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$GPUConnectionTypeToJson(this);
// GPUConnectionType.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       connectionType = json["connectionType"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "connectionType": connectionType,
//   };
//
//   return data;
// }
}
