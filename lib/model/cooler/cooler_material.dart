import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cooler_material.g.dart';

@JsonSerializable()
class CoolerMaterial implements Model{
  final int? id;
  String material;

  CoolerMaterial(this.id, {required this.material});

  factory CoolerMaterial.fromJson(Map<String, dynamic> json) =>
      _$CoolerMaterialFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CoolerMaterialToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), material];

    return fields;
  }

}
