import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gpu_to_connector.g.dart';

@JsonSerializable()
class GPUToConnector {
  final int id;
  GraphicCard graphicCard;
  GPUConnector gpuConnector;
  int count;

  GPUToConnector(
    this.id,
    this.graphicCard,
    this.gpuConnector,
    this.count,
  );

  factory GPUToConnector.fromJson(Map<String, dynamic> json) =>
      _$GPUToConnectorFromJson(json);

  Map<String, dynamic> toJson() => _$GPUToConnectorToJson(this);
}
