import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cpu_pcie_version.g.dart';

@JsonSerializable()
class CPUPCIeVersion implements Model{
  final int? id;
  String name;

  CPUPCIeVersion(this.id, this.name);

  factory CPUPCIeVersion.fromJson(Map<String, dynamic> json) =>
      _$CPUPCIeVersionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CPUPCIeVersionToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), name];

    return fields;
  }

}
