import 'package:json_annotation/json_annotation.dart';

part 'gpu_interface_type.g.dart';

@JsonSerializable()
class GPUInterfaceType {
  final int id;
  String interfaceType;

  GPUInterfaceType(this.id, this.interfaceType);

  factory GPUInterfaceType.fromJson(Map<String, dynamic> json) =>
      _$GPUInterfaceTypeFromJson(json);

  Map<String, dynamic> toJson() => _$GPUInterfaceTypeToJson(this);
// GPUInterfaceType.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       interfaceType = json["interfaceType"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "interfaceType": interfaceType,
//   };
//
//   return data;
// }
}
