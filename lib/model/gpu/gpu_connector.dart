import 'package:json_annotation/json_annotation.dart';

part 'gpu_connector.g.dart';

@JsonSerializable()
class GPUConnector {
  final int id;
  String connector;

  GPUConnector(this.id, this.connector);

  factory GPUConnector.fromJson(Map<String, dynamic> json) =>
      _$GPUConnectorFromJson(json);

  Map<String, dynamic> toJson() => _$GPUConnectorToJson(this);
}
