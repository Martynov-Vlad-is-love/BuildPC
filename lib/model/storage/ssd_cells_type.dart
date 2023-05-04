import 'package:json_annotation/json_annotation.dart';

part 'ssd_cells_type.g.dart';

@JsonSerializable()
class SsdCellsType {
  final int id;
  String name;

  SsdCellsType(this.id, this.name);

  factory SsdCellsType.fromJson(Map<String, dynamic> json) =>
      _$SsdCellsTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SsdCellsTypeToJson(this);
// SSDCellsType.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       cellsType = json["cellsType"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "cellsType": cellsType,
//   };
//
//   return data;
// }
}
