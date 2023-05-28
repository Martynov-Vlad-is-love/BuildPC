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
}
