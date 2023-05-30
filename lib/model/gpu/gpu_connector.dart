import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gpu_connector.g.dart';

@JsonSerializable()
class GPUConnector implements Model {
  final int id;
  String connector;

  GPUConnector(this.id, this.connector);

  factory GPUConnector.fromJson(Map<String, dynamic> json) =>
      _$GPUConnectorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GPUConnectorToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), connector];

    return fields;
  }
}
