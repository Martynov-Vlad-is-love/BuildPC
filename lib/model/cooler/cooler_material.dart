import 'package:json_annotation/json_annotation.dart';

part 'cooler_material.g.dart';

@JsonSerializable()
class CoolerMaterial {
  final int id;
  String material;

  CoolerMaterial(this.id, this.material);

  factory CoolerMaterial.fromJson(Map<String, dynamic> json) =>
      _$CoolerMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$CoolerMaterialToJson(this);

}
