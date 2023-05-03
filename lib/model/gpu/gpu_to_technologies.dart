import 'package:buildpc/model/gpu/gpu_technologies.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gpu_to_technologies.g.dart';

@JsonSerializable()
class GPUToTechnologies {
  final int id;
  GraphicCard graphicCard;
  GPUTechnologies gpuTechnologies;
  int count;

  GPUToTechnologies(
    this.id,
    this.graphicCard,
    this.gpuTechnologies,
    this.count,
  );

  factory GPUToTechnologies.fromJson(Map<String, dynamic> json) =>
      _$GPUToTechnologiesFromJson(json);

  Map<String, dynamic> toJson() => _$GPUToTechnologiesToJson(this);
}
