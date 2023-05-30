import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gpu_interface_type.g.dart';

@JsonSerializable()
class GPUInterfaceType implements Model {
  final int id;
  String interfaceType;

  GPUInterfaceType(this.id, this.interfaceType);

  factory GPUInterfaceType.fromJson(Map<String, dynamic> json) =>
      _$GPUInterfaceTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GPUInterfaceTypeToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), interfaceType];

    return fields;
  }
}
