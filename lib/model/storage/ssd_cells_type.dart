import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ssd_cells_type.g.dart';

@JsonSerializable()
class SsdCellsType implements Model{
  final int? id;
  String name;

  SsdCellsType(this.id, {required this.name});

  factory SsdCellsType.fromJson(Map<String, dynamic> json) =>
      _$SsdCellsTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SsdCellsTypeToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), name];

    return fields;
  }
}
